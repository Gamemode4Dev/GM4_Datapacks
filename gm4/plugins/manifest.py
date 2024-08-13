import datetime
import hashlib
import json
import logging
import os
import sys
from gzip import GzipFile
from io import BytesIO
from pathlib import Path
from typing import Any, Optional

import yaml
from beet import Context, InvalidProjectConfig, PluginOptions, TextFile, load_config
from beet.library.base import _dump_files  # type: ignore ; private method used to deterministicify pack dumping
from nbtlib.contrib.minecraft import StructureFileData, StructureFile  # type: ignore ; no stub
from pydantic.v1 import BaseModel, Extra
from repro_zipfile import ReproducibleZipFile  # type: ignore ; no stub

from gm4.plugins.versioning import VersioningConfig
from gm4.utils import Version, run

parent_logger = logging.getLogger("gm4.manifest")

SUPPORTED_GAME_VERSIONS = ["1.21", "1.21.1"]

# config models for beet.yaml metas
CreditsModel = dict[str, list[str]]

class WebsiteConfig(PluginOptions):
	description: str
	recommended: list[str] = []
	notes: list[str] = []
	search_keywords: list[str] = []

class ModrinthConfig(PluginOptions):
	project_id: str

class SmithedConfig(PluginOptions):
	pack_id: str

class PMCConfig(PluginOptions):
	uid: int

class ManifestConfig(PluginOptions, extra=Extra.ignore):
	minecraft: list[str] = SUPPORTED_GAME_VERSIONS
	versioning: Optional[VersioningConfig]
	# distribution
	website: Optional[WebsiteConfig]
	modrinth: Optional[ModrinthConfig]
	smithed: Optional[SmithedConfig]
	pmc: Optional[PMCConfig]
	# promo
	video: str|None
	wiki: str|None
	credits: CreditsModel

# models for meta.json and cached manifest
class ManifestModuleModel(BaseModel):
	"""Single module's entry in manifest"""
	id: str
	name: str
	version: str
	hash: str
	video_link: str = ""
	wiki_link: str = ""
	credits: CreditsModel
	requires: list[str] = []
	description: str
	recommends: list[str] = []
	minecraft: list[str] = []
	hidden: bool = False
	important_note: Optional[str]
	search_keywords: list[str] = []
	publish_date: Optional[str]
	modrinth_id: Optional[str]
	smithed_link: Optional[str]
	pmc_link: Optional[int]


class ManifestCacheModel(BaseModel):
	"""describes the structure of the cached manifest"""
	last_commit: str
	modules: dict[str, ManifestModuleModel]
	libraries: dict[str, ManifestModuleModel]
	base: Any
	contributors: Any

class ManifestFileModel(BaseModel):
	"""describes the structure of the meta.json saved to disk"""
	last_commit: str
	modules: list[ManifestModuleModel] # straight list for website backward compat
	libraries: dict[str, ManifestModuleModel]
	contributors: Any


def create(ctx: Context):
	"""Collect a manifest for all modules from respective beet.yaml files."""
	manifest = ManifestCacheModel(last_commit=run(["git", "rev-parse", "HEAD"]), modules={}, libraries={}, base={}, contributors=None)
	logger = parent_logger.getChild("create")

	for glob, manifest_section in [("gm4_*", manifest.modules), ("lib_*", manifest.libraries), ("resource_pack", manifest.modules)]:
		for pack_id in [p.name for p in sorted(ctx.directory.glob(glob))]:
			try:
				config = load_config(Path(pack_id) / "beet.yaml")
				gm4_meta = ctx.validate("gm4", validator=ManifestConfig, options=config.meta["gm4"]) # manually parse config into models  

				manifest_section[pack_id] = ManifestModuleModel(
					id = config.id,
					name = config.name,
					version = config.version,
					hash = "",
					video_link = gm4_meta.video or "",
					wiki_link = gm4_meta.wiki or "",
					credits = gm4_meta.credits,
					requires = [e for e in gm4_meta.versioning.required.keys() if not e.startswith("lib")] if gm4_meta.versioning else [],
					description = gm4_meta.website.description if gm4_meta.website else "",
					recommends = gm4_meta.website.recommended if gm4_meta.website else [],
					important_note = gm4_meta.website.notes[0] if gm4_meta.website and len(gm4_meta.website.notes) > 0 else None,
					minecraft = gm4_meta.minecraft,
					hidden = len(gm4_meta.minecraft) == 0 or gm4_meta.website is None,
					publish_date = None,
					search_keywords = gm4_meta.website.search_keywords if gm4_meta.website else [],
					modrinth_id = gm4_meta.modrinth.project_id if gm4_meta.modrinth else None,
					smithed_link = gm4_meta.smithed.pack_id if gm4_meta.smithed else None,
					pmc_link = gm4_meta.pmc.uid if gm4_meta.pmc else None,
				)
			except InvalidProjectConfig as exc:
				logger.debug(exc.explanation)

	# Read the contributors metadata
	contributors_file = Path("gm4/contributors.json")
	if contributors_file.exists():
		contributors_list = json.loads(contributors_file.read_text())
		manifest.contributors = {c["name"]: c for c in contributors_list}
	else:
		logger.debug("No contributors.json found")
		manifest.contributors = []

	# Read the gm4 base module metadata
	base_file = Path("base/beet.yaml")
	base_config = yaml.safe_load(base_file.read_text())
	manifest.base = {"version": base_config["version"]}

	# Cache the new manifest, so sub-pipelines can access it
	ctx.cache["gm4_manifest"].json = manifest.dict()

	# Read in the previous manifest, if found
	version = os.getenv("VERSION", "1.21")
	release_dir = Path('release') / version
	manifest_file = release_dir / "meta.json"

	if manifest_file.exists():
		ctx.cache["previous_manifest"].json = json.loads(manifest_file.read_text())
	else:
		if not ctx.meta.get("gm4_dev"):
			if os.getenv("MASTER_BUILD"): # gh actions is building - forgetting to add a meta.json breaks things
				logger.error("No existing meta.json manifest file was located. Build was cancelled to avoid faulty releases.")
				sys.exit(1) # quit the build and mark the github action as failed
			else:
				logger.warn("No existing meta.json manifest file was located")
		ctx.cache["previous_manifest"].json = ManifestFileModel(last_commit="",modules=[],libraries={},contributors=[]).dict()

	

def update_patch(ctx: Context):
    """Checks the datapack files for changes from last build, and increments patch number"""
    yield
    logger = parent_logger.getChild("update_patch")

    # load current manifest from cache
    this_manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
    pack = ({e.id:e for e in (this_manifest.libraries|this_manifest.modules).values()})[ctx.project_id]

    # attempt to load prior meta.json manifest
    last_manifest = ManifestFileModel.parse_obj(ctx.cache["previous_manifest"].json)
    released_modules: dict[str, ManifestModuleModel] = {m.id:m for m in last_manifest.modules if m.version}|{l.id:l for l in last_manifest.libraries.values()}

    # determine this modules status
    released = released_modules.get(ctx.project_id, None)
    last_ver = Version(released.version) if released else Version("0.0.0")
    this_ver = Version(ctx.project_version)
    publish_date = released.publish_date if released else None
    pack.publish_date = publish_date or datetime.datetime.now().date().isoformat()
    old_hash = released.hash if released else ""

    # watch for output file changes
    fileobj = BytesIO()
    scanned_pack = ctx.packs[0 if ctx.meta.get("pack_scan")=="resource_pack" else 1]
    with ReproducibleZipFile(fileobj, mode='w') as zf:
        _dump_files(zf, sorted(scanned_pack.list_files())) # write datapack to temporary memory
            # beet's default dump depends on file load order, which is nondeterministic
            # here we recreate the ctx.data.dump(zf) behavior but by sorting the files first

    new_hash = hashlib.sha1(fileobj.getvalue()).hexdigest()
    pack.hash = new_hash

    # first release of a module
    if not released:
        pack.version = pack.version.replace("X", "0")
        logger.debug(f"First release of {ctx.project_id}", extra={"project_id": ctx.project_id})

    # otherwise check for changes
    else:
        if (this_ver != last_ver.replace(patch=None)) or (new_hash != old_hash): # changes were made, bump the patch
            if this_ver.minor > last_ver.minor or this_ver.major > last_ver.major: # type: ignore
                this_ver.patch = 0
                logger.info(f"Feature update for {ctx.project_id}, setting version to {this_ver}", extra={"gh_annotate_skip": True, "project_id": ctx.project_id})
            else:
                this_ver.patch = last_ver.patch + 1 # type: ignore
                logger.info(f"Patch update for {ctx.project_id}, incrementing to {this_ver}", extra={"gh_annotate_skip": True, "project_id": ctx.project_id})

            pack.version = str(this_ver)

        else: # no changes, keep the patch
             pack.version = released.version

    ctx.cache["gm4_manifest"].json = this_manifest.dict()


def write_meta(ctx: Context):
	"""Write the updated meta.json file."""
	version = os.getenv("VERSION", "1.21")
	release_dir = Path('release') / version
	os.makedirs(release_dir, exist_ok=True)

	manifest_file = release_dir / "meta.json"
	manifest = ctx.cache["gm4_manifest"].json.copy()
	manifest["modules"] = list(manifest["modules"].values()) # convert modules dict down to list for backwards compatability
	manifest.pop("base")
	manifest_file.write_text(json.dumps(manifest, indent=2))


def write_credits(ctx: Context):
	"""Writes the credits metadata to CREDITS.md. and collects for README.md"""
	manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
	contributors = manifest.contributors
	module = manifest.modules.get(ctx.project_id)
	credits = module.credits if module else {}
	if len(credits) == 0:
		return

	# traverses contributors and associates name with links for printing
	linked_credits: CreditsModel = {}
	for title in credits:
		people = credits[title]
		if len(people) == 0:
			continue
		linked_credits[title] = []
		for p in people:
			contributor = contributors.get(p, { "name": p })
			name = contributor.get("name", p)
			links: list[str] | str = contributor.get("links", [])
			if isinstance(links, list) and len(links) >= 1:
				linked_credits[title].append(f"[{name}]({links[0]})")
			else:
				linked_credits[title].append(f"{name}")
	
	# format credits for CREDITS.md
	text = "# Credits\n"
	for title in linked_credits:
		text += f"\n## {title}\n"
		for link in linked_credits[title]:
			text += f'- {link}\n'

	ctx.data.extra["CREDITS.md"] = TextFile(text)
	ctx.meta['linked_credits'] = linked_credits # pass data to README portion of pipeline


def write_updates(ctx: Context):
	"""Writes the module update commands to this module's init function."""
	init = ctx.data.functions.get(f"{ctx.project_id}:init", None)
	if init is None:
		return

	manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
	modules = manifest.modules

	score = f"{ctx.project_id.removeprefix('gm4_')} gm4_modules"
	version = Version(modules[ctx.project_id].version)

	# Update score setter for this module, and add version to gm4:log
	last_i=-1
	for i, line in enumerate(init.lines):
		if "gm4_modules" in line:
			init.lines[i] = line.replace(f"{score} 1", f"{score} {version.int_rep()}").replace(f"{score} matches 1", f"{score} matches {version.int_rep()}")
			last_i = i

	init.lines.insert(last_i+1, f"data modify storage gm4:log versions append value {{id:\"{ctx.project_id}\",module:\"{ctx.project_name}\",version:\"{version}\"}}")
        
	# Remove the marker if it exists
	if "#$moduleUpdateList" in init.lines:
		init.lines.remove("#$moduleUpdateList")

	# Append the module update list regardless if the marker existed
	init.lines.append("# Module update list")
	init.lines.append("data remove storage gm4:log queue[{type:'outdated'}]")
	for i, m in modules.items():
		if not i.startswith("gm4_"):
			continue # not a datapack (ie the rp) and has score to print
		version = Version(m.version).int_rep()
		website = f"https://gm4.co/modules/{m.id[4:].replace('_','-')}"
		init.lines.append(f"execute if score {m.id} load.status matches -1.. if score {m.id.removeprefix('gm4_')} gm4_modules matches ..{version - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m.name}',download:'{website}',render:'{{\"text\":\"{m.name}\",\"clickEvent\":{{\"action\":\"open_url\",\"value\":\"{website}\"}},\"hoverEvent\":{{\"action\":\"show_text\",\"value\":{{\"text\":\"Click to visit {website}\",\"color\":\"#4AA0C7\"}}}}}}'}}")
	
def repro_structure_to_bytes(content: StructureFileData) -> bytes:
    """a modified Structure.to_bytes from beet, which ensures the GZip does not add
       the current time.time to the nbt file header. 
       Used for deterministic pack builds and auto-patch detection"""
    dst = BytesIO()
    with GzipFile(fileobj=dst, mode="wb", mtime=0) as fileobj:
        StructureFile(content).write(fileobj) # type: ignore ; nbtlib has no type annotations
    return dst.getvalue()
