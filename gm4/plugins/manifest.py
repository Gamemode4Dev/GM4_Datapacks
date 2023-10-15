import datetime
import json
import logging
import os
from functools import cache
from pathlib import Path
from typing import Any, Optional
from pydantic import Extra, BaseModel

import yaml
from beet import Context, JsonFile, PluginOptions, TextFile, load_config, InvalidProjectConfig

from gm4.plugins.versioning import VersioningConfig
from gm4.plugins.output import ModrinthConfig, SmithedConfig, PMCConfig
from gm4.utils import Version, run

parent_logger = logging.getLogger("gm4.manifest")

# config models for beet.yaml metas
CreditsModel = dict[str, list[str]]

class WebsiteConfig(PluginOptions):
	description: str
	recommended: list[str] = []
	notes: list[str] = []
	hidden: bool = False
	search_keywords: list[str] = []

class ManifestConfig(PluginOptions, extra=Extra.ignore):
	versioning: Optional[VersioningConfig]
	website: WebsiteConfig
	video: str|None
	wiki: str|None
	credits: CreditsModel

# models for meta.json and cached manifest
class ManifestModuleModel(BaseModel):
	"""Single module's entry in manifest"""
	id: str
	name: str
	version: str
	video_link: str = ""
	wiki_link: str = ""
	credits: CreditsModel
	requires: list[str] = []
	description: str
	recommends: list[str] = []
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

	LIB_OVERRIDES: dict[Any, Any] = {
		"website": {"description": "", "recommended": [], "notes": []},
		"video": None, "wiki": None
	}

	for glob, manifest_section, config_overrides in [("gm4_*", manifest.modules, {}), ("lib_*", manifest.libraries, LIB_OVERRIDES)]:
		for pack_id in [p.name for p in sorted(ctx.directory.glob(glob))]:
			try:
				config = load_config(Path(pack_id) / "beet.yaml")
				gm4_meta = ctx.validate("gm4", validator=ManifestConfig, options=config.meta["gm4"]|config_overrides) # manually parse config into models  
				modrinth_meta = ctx.validate("modrinth", validator=ModrinthConfig, options=config.meta.get("modrinth"))
				smithed_meta = ctx.validate("smithed", validator=SmithedConfig, options=config.meta.get("smithed"))
				pmc_meta = ctx.validate("pmc", validator=PMCConfig, options=config.meta.get("pmc"))

				manifest_section[pack_id] = ManifestModuleModel(
					id = config.id,
					name = config.name,
					version = config.version,
					video_link = gm4_meta.video or "",
					wiki_link = gm4_meta.wiki or "",
					credits = gm4_meta.credits,
					requires = [e for e in gm4_meta.versioning.required.keys() if not e.startswith("lib")] if gm4_meta.versioning else [],
					description = gm4_meta.website.description,
					recommends = gm4_meta.website.recommended,
					important_note = gm4_meta.website.notes[0] if len(gm4_meta.website.notes)>0 else None,
					hidden = gm4_meta.website.hidden,
					publish_date = None,
					search_keywords = gm4_meta.website.search_keywords,
					modrinth_id = modrinth_meta.project_id,
					smithed_link = smithed_meta.pack_id,
					pmc_link = pmc_meta.uid
				)
			except InvalidProjectConfig as exc:
				logger.debug(exc.explanation)

	# Read the contributors metadata
	contributors_file = Path("contributors.json")
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


def update_patch(ctx: Context):
	"""Retrieves manifest from previous build, and increments patch number
	 	 if there are any changes between last commit and HEAD in module or any of its dependancies"""
	version = os.getenv("VERSION", "1.20")
	release_dir = Path('release') / version
	manifest_file = release_dir / "meta.json"
	logger = parent_logger.getChild("update_patch")
	skin_cache = JsonFile(source_path="gm4/skin_cache.json").data

	manifest_cache = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)

	if manifest_file.exists():
		manifest = ManifestFileModel.parse_obj(json.loads(manifest_file.read_text()))
		last_commit = manifest.last_commit
		released_modules: dict[str, ManifestModuleModel] = {m.id:m for m in manifest.modules if m.version}
		released_modules |= manifest.libraries
	else:
		logger.debug("No existing meta.json manifest file was located")
		last_commit = None
		released_modules = {}

	for packs in (manifest_cache.modules, manifest_cache.libraries):
		for id in packs:
			pack = packs[id]
			released = released_modules.get(id, None)

			publish_date = released.publish_date if released else None
			pack.publish_date = publish_date or datetime.datetime.now().date().isoformat()

			deps = _traverse_includes(id)
			if packs is manifest_cache.modules:
				deps |= {"base"} # scan the base directory if this is a module
			deps_dirs = [element for sublist in [[f"{d}/data", f"{d}/*py"] for d in deps] for element in sublist]

			# add watches to skins this module uses from other modules. NOTE this could be done in a more extendable way in the future, rather than "hardcoded"
			skin_dep_dirs: list[str] = []
			for skin_ref in skin_cache["nonnative_references"].get(id, []):
				d = skin_cache["skins"][skin_ref]["parent_module"]
				ns, path = skin_ref.split(":")	
				skin_dep_dirs.append(f"{d}/data/{ns}/skins/{path}.png")
			
			watch_dirs = deps_dirs+skin_dep_dirs

			diff = run(["git", "diff", last_commit, "--shortstat", "--", f"{id}/data", f"{id}/*.py"] + watch_dirs) if last_commit else True

			if not diff and released:
				# No changes were made, keep the same patch version
				pack.version = released.version
			elif not released:
				# First release
				pack.version = pack.version.replace("X", "0")
				logger.debug(f"First release of {id}")
			else:
				# Changes were made, bump the patch
				version = Version(pack.version)
				last_ver = Version(released.version)
				
				if version.minor > last_ver.minor or version.major > last_ver.major: # type: ignore
					version.patch = 0
				else:
					version.patch = last_ver.patch + 1 # type: ignore
					logger.info(f"Updating {id} patch to {version.patch}")

				pack.version = str(version)

	ctx.cache["gm4_manifest"].json = manifest_cache.dict()

@cache
def _traverse_includes(project_id: str) -> set[str]:
	"""Recursively assembles list of included dependencies and sub-dependencies for a given module"""
	project_file = Path(project_id) / "beet.yaml"
	project_config = yaml.safe_load(project_file.read_text())
	all_deps: set[str] = set()
	for p in project_config.get('pipeline', []):
		if "gm4.plugins.include" in p:
			dep = p.split(".")[-1]
			sub_deps = _traverse_includes(dep)
			all_deps.update({dep, *sub_deps})
	return all_deps


def write_meta(ctx: Context):
	"""Write the updated meta.json file."""
	version = os.getenv("VERSION", "1.20")
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
	for m in modules.values():
		version = Version(m.version).int_rep()
		website = f"https://gm4.co/modules/{m.id[4:].replace('_','-')}"
		init.lines.append(f"execute if score {m.id} load.status matches -1.. if score {m.id.removeprefix('gm4_')} gm4_modules matches ..{version - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m.name}',download:'{website}',render:'{{\"text\":\"{m.name}\",\"clickEvent\":{{\"action\":\"open_url\",\"value\":\"{website}\"}},\"hoverEvent\":{{\"action\":\"show_text\",\"value\":{{\"text\":\"Click to visit {website}\",\"color\":\"#4AA0C7\"}}}}}}'}}")
	
