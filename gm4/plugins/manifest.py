from beet import Context, TextFile
from pathlib import Path
from typing import Any
import json
import os
import subprocess
import yaml


def run(cmd: list[str]) -> str:
	"""Run a shell command and return the stdout."""
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()


def create(ctx: Context):
	"""Collect a manifest for all modules and update their patch version if necessary."""
	version = os.getenv("VERSION", "1.19")
	prefix = int(os.getenv("PATCH_PREFIX", 0))
	release_dir = Path('release') / version
	manifest_file = release_dir / "meta.json"

	modules: list[dict[str, Any]] = [{"id": p.name} for p in sorted(ctx.directory.glob("gm4_*"))]

	for module in modules:
		project_file = Path(module["id"]) / "beet.yaml"
		if project_file.exists():
			# Read all the metadata from the module's beet.yaml file
			project_config = yaml.safe_load(project_file.read_text())
			module["name"] = project_config["name"]
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
	modules = [m for m in modules if m["id"] is not None]

	if manifest_file.exists():
		manifest = json.loads(manifest_file.read_text())
		last_commit = manifest["last_commit"]
		released_modules: list[dict[str, Any]] = manifest["modules"]
	else:
		last_commit = None
		released_modules = []

	download_links: dict[str, dict[str, str]] = {}
	for module in modules:
		id = module["id"]

		# Check if there are any changes between last commit and HEAD
		diff = run(["git", "diff", last_commit, "--shortstat", "--", id]) if last_commit else True
		released = next((m for m in released_modules if m["id"] == id), None)

		if not diff and released:
			# No changes were made, keep the same patch version
			module["patch"] = released["patch"]
		else:
			# Changes were made or this is the first release, bump the patch
			patch = released["patch"] if released else prefix
			module["patch"] = patch + 1
			print(f"[GM4] Updating {id} to {patch + 1}")

		# Assemble lookup table of available download links
		download_links.update({
			id: {
				"modrinth_id": module["modrinth_id"],
				"smithed_link": module["smithed_link"],
				"pmc_link": module["pmc_link"]
			}
		})
	ctx.cache["download_links"].json = download_links
	
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
		"contributors": contributors,
	}
	ctx.cache["gm4_manifest"].json = new_manifest


def write_meta(ctx: Context):
	"""Write the updated meta.json file."""
	version = os.getenv("VERSION", "1.19")
	release_dir = Path('release') / version
	os.makedirs(release_dir, exist_ok=True)

	manifest_file = release_dir / "meta.json"
	manifest = ctx.cache["gm4_manifest"].json
	manifest_file.write_text(json.dumps(manifest, indent=2))


def write_credits(ctx: Context):
	"""Writes the credits metadata to CREDITS.md. and collects for README.md"""
	manifest = ctx.cache["gm4_manifest"].json
	contributors = manifest.get("contributors", {})
	credits: dict[str, list[str]] = next((m["credits"] for m in manifest.get("modules", []) if m["id"] == ctx.project_id), {})
	if credits is None or len(credits) == 0:
		return

	# traverses contributors and associates name with links for printing
	linked_credits: dict[str, list[str]] = {}
	for title in credits:
		people = credits[title]
		if not isinstance(people, list) or len(people) == 0:
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
	for m in modules:
		init.lines.append(f"execute if score {m['id'].removeprefix('gm4_')} gm4_modules matches ..{m['patch'] - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m['name']}'}}")
