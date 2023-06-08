from beet import Context, TextFile
from pathlib import Path
from typing import Any
import json
import os
import yaml
from gm4.utils import run, Version


def create(ctx: Context):
	"""Collect a manifest for all modules from respective beet.yaml files."""
	modules: dict[str, dict[str, Any]] = { p.name:{"id": p.name} for p in sorted(ctx.directory.glob("gm4_*")) }

	for m_key in modules:
		module = modules[m_key]
		project_file = Path(m_key) / "beet.yaml"
		if project_file.exists():
			# Read all the metadata from the module's beet.yaml file
			project_config = yaml.safe_load(project_file.read_text())
			module["name"] = project_config["name"]
			module["version"] = project_config.get("version", "0.0.0")
			meta = project_config.get("meta", {}).get("gm4", {})
			website = meta["website"]
			module["video_link"] = meta["video"] or ""
			module["wiki_link"] = meta["wiki"] or ""
			module["credits"] = meta["credits"]
			versioning_config = meta.get("versioning", {})
			module["requires"] = list(filter(lambda a: "lib" not in a[0:4], map(lambda a: list(a.keys())[0], versioning_config.get("required", []))))
			module["description"] = website["description"]
			module["recommends"] = website["recommended"]
			if "hidden" in website and website["hidden"]:
				module["hidden"] = True
			if "notes" in website and len(website["notes"]) > 0:
				module["important_note"] = website["notes"][0]
			module["modrinth_id"] = project_config.get("meta", {}).get("modrinth", {}).get("project_id")
			module["smithed_link"] = project_config.get("meta", {}).get("smithed", {}).get("uid") # NOTE field to be named when smithed api v2 leaves beta
			module["pmc_link"] = project_config.get("meta", {}).get("planetminecraft", {}).get("uid") # NOTE PMC currently has no API, so this field is just made of hope
			module.update()
		else:
			module["id"] = None

	# If a module doesn't have a valid beet.yaml file don't include it
	modules = {k:v for k,v in modules.items() if v["id"] is not None}

	# Collect libraries
	libraries: dict[str, dict[str, Any]] = { p.name:{} for p in sorted(ctx.directory.glob("lib_*")) }

	for l_key in libraries:
		lib = libraries[l_key]
		project_file = Path(l_key) / "beet.yaml"
		if project_file.exists():
			project_config = yaml.safe_load(project_file.read_text())
			lib["id"] = project_config["id"]
			lib["name"] = project_config["name"]
			lib["version"] = project_config.get("version", "0.0.0")
			lib["requires"] = project_config.get("meta", {}).get("gm4", {}).get("required", [])

	# Read the contributors metadata
	contributors_file = Path("contributors.json")
	if contributors_file.exists():
		contributors_list = json.loads(contributors_file.read_text())
		contributors: Any = {c["name"]: c for c in contributors_list}
	else:
		contributors = []

	# Read the gm4 base module metadata
	base_file = Path("base/beet.yaml")
	base_config = yaml.safe_load(base_file.read_text())
	base = {"version": base_config["version"]}

	# Create the new manifest, using HEAD as the new last commit
	head = run(["git", "rev-parse", "HEAD"])
	new_manifest = {
		"last_commit": head,
		"modules": modules,
		"libraries": libraries,
		"base": base,
		"contributors": contributors,
	}
	ctx.cache["gm4_manifest"].json = new_manifest


def update_patch(ctx: Context):
	"""Retrieves manifest from previous build, and increments patch number
	 	 if there are any changes between last commit and HEAD"""
	version = os.getenv("VERSION", "1.20")
	release_dir = Path('release') / version
	manifest_file = release_dir / "meta.json"

	modules = ctx.cache["gm4_manifest"].json["modules"]

	if manifest_file.exists():
		manifest = json.loads(manifest_file.read_text())
		last_commit = manifest["last_commit"]
		released_modules: dict[str, dict[str, Any]] = {m["id"]:m for m in manifest["modules"] if m.get("version", None)}
	else:
		last_commit = None
		released_modules = {}

	for id in modules:
		module = modules[id]

		diff = run(["git", "diff", last_commit, "--shortstat", "--", id, ":!*\\README.md", ":!images"]) if last_commit else True
		released = released_modules.get(id, None)

		if not diff and released:
			# No changes were made, keep the same patch version
			module["version"] = released["version"]
		elif not released:
			# First release
			module["version"] = module["version"].replace("X", "0")
		else:
			# Changes were made, bump the patch
			version = Version(module["version"])
			last_ver = Version(released["version"])
			
			if version.minor > last_ver.minor or version.major > last_ver.major: # type: ignore
				version.patch = 0
			else:
				version.patch = last_ver.patch + 1 # type: ignore
				print(f"[GM4] Updating {id} patch to {version.patch}")

			module["version"] = str(version)

	ctx.cache["gm4_manifest"].json["modules"] = modules


def write_meta(ctx: Context):
	"""Write the updated meta.json file."""
	version = os.getenv("VERSION", "1.20")
	release_dir = Path('release') / version
	os.makedirs(release_dir, exist_ok=True)

	manifest_file = release_dir / "meta.json"
	manifest = ctx.cache["gm4_manifest"].json.copy()
	manifest["modules"] = list(manifest["modules"].values()) # convert modules dict down to list for backwards compatability
	manifest.pop("libraries")
	manifest.pop("base")
	manifest_file.write_text(json.dumps(manifest, indent=2))


def write_credits(ctx: Context):
	"""Writes the credits metadata to CREDITS.md. and collects for README.md"""
	manifest = ctx.cache["gm4_manifest"].json
	contributors = manifest.get("contributors", {})
	credits: dict[str, list[str]] = manifest["modules"].get(ctx.project_id, {}).get("credits", {})
	if len(credits) == 0:
		return

	# traverses contributors and associates name with links for printing
	linked_credits: dict[str, list[str]] = {}
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

	manifest = ctx.cache["gm4_manifest"].json
	modules = manifest["modules"]

	score = f"{ctx.project_id.removeprefix('gm4_')} gm4_modules"
	version = Version(modules[ctx.project_id]["version"])

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
		version = Version(m["version"]).int_rep()
		website = f"https://gm4.co/modules/{m['id'][4:].replace('_','-')}"
		init.lines.append(f"execute if score {m['id']} load.status matches -1.. if score {m['id'].removeprefix('gm4_')} gm4_modules matches ..{version - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m['name']}',download:'{website}',render:'{{\"text\":\"{m['name']}\",\"clickEvent\":{{\"action\":\"open_url\",\"value\":\"{website}\"}},\"hoverEvent\":{{\"action\":\"show_text\",\"value\":{{\"text\":\"Click to visit {website}\",\"color\":\"#4AA0C7\"}}}}}}'}}")
	