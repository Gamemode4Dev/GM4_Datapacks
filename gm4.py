from beet import Context, subproject
from beet.contrib.load import load
import json
import os
import subprocess

BASE = "base"
OUTPUT = "out"
RELEASE = "release"

CONTRIBUTOR_KEY_NAME = "name"
CONTRIBUTOR_KEY_LINKS = "links"

def run(cmd: list[str]) -> str:
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()


def build_modules(ctx: Context):
	version = os.getenv("VERSION", "1.18")
	prefix = int(os.getenv("PATCH_PREFIX", 0))

	dev: list[str] = [f"gm4_{id}" for id in ctx.meta.get("dev", "").split("+") if id]
	modules = [{"id": p.name} for p in sorted(ctx.directory.glob("gm4_*"))]
	print(f"[GM4] Found {len(modules)} modules")

	head = run(["git", "rev-parse", "HEAD"])
	try:
		with open(f"{RELEASE}/{version}/meta.json", "r") as f:
			meta = json.load(f)
			released_modules = meta["modules"]
			last_commit = meta["last_commit"]
	except:
		released_modules = []
		last_commit = None

	with open("contributors.json", "r") as f:
		contributors: dict[str, dict] = json.load(f)

	for module in modules:
		id = module["id"]

		try:
			with open(f"{id}/pack.mcmeta", "r+") as f:
				meta: dict = json.load(f)

				module["name"] = meta.get("module_name", id)
				module["description"] = meta.get("site_description", "")
				module["categories"] = meta.get("site_categories", [])
				module["libraries"] = meta.get("libraries", [])
				module["requires"] = [f"gm4_{id}" for id in meta.get("required_modules", [])]
				module["hidden"] = meta.get("hidden", False)

				credits = meta.get("credits", {})
				module["credits"] = {
					title: [
						dict(name=p[0], **contributors.get(p[0], {}))
						for p in credits[title]
					]
					for title in credits
				}

		except:
			module["id"] = None
			continue

		if dev:
			continue

		diff = run(["git", "diff", last_commit, "--shortstat", "--", BASE, *module["libraries"], id]) if last_commit else True

		released: dict | None = next((m for m in released_modules if m["id"] == id), None)

		if not diff and released:
			module["patch"] = released["patch"]
		else:
			new_patch = released["patch"] + 1 if released else prefix
			module["patch"] = new_patch
			print(f"Updating {id} -> {new_patch}")

	if dev:
		libs = set()
		packs = set()
		for d in dev:
			packs.add(d)
			module = next((m for m in modules if m["id"] == d), None)
			if module is None:
				raise ValueError(f"Module '{d}' not found")
			for l in module["libraries"]:
					libs.add(l)
			for r in module["requires"]:
				packs.add(r)
				required = next(m for m in modules if m["id"] == r)
				for l in required["libraries"]:
					libs.add(l)

		ctx.require(load(
			data_pack=[BASE, *libs, *packs]
		))

		print(f"[GM4] Generated development pack: [{' '.join([*list(packs), *list(libs)])}]")

	else:
		module_updates = [{k: m[k] for k in ["id", "name", "patch"]} for m in modules if m["id"]]

		os.makedirs(OUTPUT, exist_ok=True)
		with open(f"{OUTPUT}/meta.json", "w") as f:
			out = {
				"last_commit": head,
				"modules": [m for m in modules if m.get("id") is not None],
			}
			json.dump(out, f, indent=2)
			f.write('\n')

		for module in modules:
			id = module["id"]
			if not id:
				continue
			ctx.require(subproject({
				"id": id,
				"data_pack": {
					"name": f"{id}_{version.replace('.', '_')}",
					"load": [BASE, *module["libraries"], id],
					"zipped": True,
				},
				"output": OUTPUT,
				"pipeline": [
					"gm4.module_updates",
					"gm4.populate_credits"
				],
				"meta": {
					"module_updates": module_updates,
					"credits": module["credits"]
				}
			}))
			print(f"Generated {id}")


def module_updates(ctx: Context):
	init = ctx.data.functions[f"{ctx.project_id}:init"]
	updates = ctx.meta["module_updates"]

	score = f"{ctx.project_id.removeprefix('gm4_')} gm4_modules"
	patch = next(m for m in updates if m["id"] == ctx.project_id)["patch"]

	for i, line in enumerate(init.lines):
		if "gm4_modules" in line:
			init.lines[i] = line.replace(f"{score} 1", f"{score} {patch}").replace(f"{score} matches 1", f"{score} matches {patch}")

	if "#$moduleUpdateList" in init.lines:
		init.lines.remove("#$moduleUpdateList")
	init.lines.append('# Module update list')
	init.lines.append('data remove storage gm4:log queue[{type:"outdated"}]')
	for m in updates:
		init.lines.append(f'execute if score {m["id"].removeprefix("gm4_")} gm4_modules matches ..{m["patch"] - 1} run data modify storage gm4:log queue append value {{type:"outdated",module:"{m["name"]}"}}')


def populate_credits(ctx: Context):
	ctx.data.mcmeta.data["credits"] = ctx.meta["credits"]
