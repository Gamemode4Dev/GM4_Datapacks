from beet import Context, TextFile
from pathlib import Path
from typing import Any
import json
import os
import yaml
from gm4.utils import run


def create(ctx: Context):
	"""Collect a manifest for all modules from respective beet.yaml files."""
	modules: dict[str, dict[str, Any]] = { p.name:{"id": p.name} for p in sorted(ctx.directory.glob("gm4_*")) }

	for m_key in modules:
		module = modules[m_key]
		project_file = Path(module["id"]) / "beet.yaml"
		if project_file.exists():
			# Read all the metadata from the module's beet.yaml file
			project_config = yaml.safe_load(project_file.read_text())
			module["name"] = project_config["name"]
			module["version"] = project_config.get("version", "0.0.0")
			meta = project_config.get("meta", {}).get("gm4", {})
			module["description"] = meta["description"]
			module["requires"] = meta["required"]
			module["recommends"] = meta["recommended"]
			module["wiki_link"] = meta["wiki"] or ""
			module["video_link"] = meta["video"] or ""
			module["credits"] = meta["credits"]
			if "hidden" in meta and meta["hidden"]:
				module["hidden"] = True
			if "notes" in meta and len(meta["notes"]) > 0:
				module["important_note"] = meta["notes"][0]
			module["modrinth_id"] = project_config.get("meta", {}).get("modrinth", {}).get("project_id")
			module["smithed_link"] = project_config.get("meta", {}).get("smithed", {}).get("uid") # NOTE field to be named when smithed api v2 leaves beta
			module["pmc_link"] = project_config.get("meta", {}).get("planetminecraft", {}).get("uid")
			module.update()
		else:
			module["id"] = None

	# If a module doesn't have a valid beet.yaml file don't include it
	modules = {k:v for k,v in modules.items() if v["id"] is not None}

	# Read the contributors metadata
	contributors_file = Path("contributors.json")
	if contributors_file.exists():
		contributors_list = json.loads(contributors_file.read_text())
		contributors: Any = {c["name"]: c for c in contributors_list}
	else:
		contributors = []

	# Create the new manifest, using HEAD as the new last commit
	head = run(["git", "rev-parse", "HEAD"])
	new_manifest = {
		"last_commit": head,
		"modules": modules,
		"contributors": contributors
	}
	ctx.cache["gm4_manifest"].json = new_manifest


def update_patch(ctx: Context):
	"""Retrieves manifest from previous build, and increments patch number
	 	 if there are any changes between last commit and HEAD"""
	version = os.getenv("VERSION", "1.19")
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
			version = dict(zip(("major", "minor"), map(int, module["version"].split(".")[0:2])))
			last_ver = dict(zip(("major", "minor", "patch"), map(int, released["version"].split("."))))
			
			if version["minor"] > last_ver["minor"] or version["major"] > last_ver["major"]:
				patch = 0
			else:
				patch = last_ver["patch"] + 1
				print(f"[GM4] Updating {id} patch to {patch}")

			module["version"] = f"{version['major']}.{version['minor']}.{patch}"

	ctx.cache["gm4_manifest"].json["modules"] = modules


def write_meta(ctx: Context):
	"""Write the updated meta.json file."""
	version = os.getenv("VERSION", "1.19")
	release_dir = Path('release') / version
	os.makedirs(release_dir, exist_ok=True)

	manifest_file = release_dir / "meta.json"
	manifest = ctx.cache["gm4_manifest"].json.copy()
	manifest["modules"] = list(manifest["modules"].values()) # convert modules dict down to list for backwards compatability
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

	# Remove the marker if it exists
	if "#$moduleUpdateList" in init.lines:
		init.lines.remove("#$moduleUpdateList")

	manifest = ctx.cache["gm4_manifest"].json
	modules = manifest["modules"]

	# Append the module update list regardless if the marker existed
	init.lines.append("# Module update list")
	init.lines.append("data remove storage gm4:log queue[{type:'outdated'}]")
	for m in modules.values():
		version = sum(map(lambda x,y: int(x)*y, m["version"].split("."), (100_000, 1_000, 1)))
		init.lines.append(f"execute if score {m['id'].removeprefix('gm4_')} gm4_modules matches ..{version - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m['name']}'}}")