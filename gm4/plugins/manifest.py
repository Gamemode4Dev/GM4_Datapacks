from beet import Context, TextFile
from typing import Any
import json
import os
import subprocess
import yaml


def run(cmd: list[str]) -> str:
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()


def create(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	prefix = int(os.getenv("PATCH_PREFIX", 0))

	modules: list[dict[str, Any]] = [{"id": p.name} for p in sorted(ctx.directory.glob("gm4_*"))]

	for module in modules:
		id = module["id"]
		try:
			with open(f"{id}/beet.yaml", "r+") as f:
				meta = yaml.safe_load(f)
				module["name"] = meta.get("name", id)
				module.update(meta.get("meta", {}).get("gm4", {}))
		except:
			module["id"] = None

	try:
		with open(f"release/{version}/meta.json", "r") as f:
			manifest: Any = json.load(f)
	except:
		manifest = {
			"last_commit": None,
			"modules": [],
			"contributors": [],
		}

	last_commit = manifest["last_commit"]
	released_modules: list[dict[str, Any]] = manifest["modules"]

	for module in modules:
		id = module["id"]
		if id is None:
			continue

		diff = run(["git", "diff", last_commit, "--shortstat", "--", id]) if last_commit else True
		released = next((m for m in released_modules if m["id"] == id), None)

		if not diff and released:
			module["patch"] = released["patch"]
		else:
			patch = released["patch"] if released else prefix
			module["patch"] = patch + 1
			print(f"[GM4] Updating {id} to {patch + 1}")
	
	try:
		with open("contributors.json", "r") as f:
			contributors: Any = {entry["name"]: entry for entry in json.load(f)}
	except:
		contributors = []

	head = run(["git", "rev-parse", "HEAD"])
	new_manifest = {
		"last_commit": head,
		"modules": [m for m in modules if m.get("id") is not None],
		"contributors": contributors,
	}
	ctx.cache["gm4_manifest"].json = new_manifest

	os.makedirs(f'release/{version}', exist_ok=True)
	with open(f'release/{version}/meta.json', 'w') as f:
		json.dump(new_manifest, f, indent=2)
		f.write('\n')


def write_credits(ctx: Context):
	manifest = ctx.cache["gm4_manifest"].json
	contributors = manifest.get("contributors", {})
	credits: dict[str, list[str]] = next((m["credits"] for m in manifest.get("modules", []) if m["id"] == ctx.project_id), {})
	if credits is None or len(credits) == 0:
		return

	text = "# Credits\n"
	for title in credits:
		people = credits[title]
		if not isinstance(people, list) or len(people) == 0:
			continue
		text += f"\n## {title}\n"
		for p in people:
			contributor = contributors.get(p, { "name": p })
			name = contributor.get("name", p)
			links: list[str] | str = contributor.get("links", [])
			if isinstance(links, list) and len(links) >= 1:
				text += f"- [{name}]({links[0]})\n"
			else:
				text += f"- {name}\n"
	ctx.data.extra["CREDITS.md"] = TextFile(text)


def write_updates(ctx: Context):
	init = ctx.data.functions.get(f"{ctx.project_id}:init", None)
	if init is None:
		return

	if "#$moduleUpdateList" in init.lines:
		init.lines.remove("#$moduleUpdateList")

	manifest = ctx.cache["gm4_manifest"].json
	modules = manifest["modules"]

	init.lines.append("# Module update list")
	init.lines.append("data remove storage gm4:log queue[{type:'outdated'}]")
	for m in modules:
		init.lines.append(f"execute if score {m['id'].removeprefix('gm4_')} gm4_modules matches ..{m['patch'] - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m['name']}'}}")
