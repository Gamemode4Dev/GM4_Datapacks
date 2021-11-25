from beet.toolchain.helpers import subproject
from beet import Context
import json
import os

BASE = "base"
OUTPUT = "out"
RELEASE = "release"

def build_modules(ctx: Context):
	modules = [{"id": p.name} for p in ctx.directory.glob("gm4_*")]
	print(f"[GM4] Found {len(modules)} modules")

	branch = os.getenv("BRANCH")
	if branch is None:
		print("BRANCH not set, defaulting to 'master'")
		branch = "master"
	else:
		print(f"Reading modules.json from {branch}")
	try:
		with open(f"{RELEASE}/{branch}/modules.json", "r") as f:
			released_modules = json.load(f)
	except:
		released_modules = []

	for module in modules:
		id = module["id"]
		try:
			with open(f"{id}/pack.mcmeta", "r") as f:
				meta = json.load(f)
		except:
			module["id"] = None
			continue

		ctx.require(subproject({
			"id": id,
			"data_pack": {
				"name": id,
				"load": [BASE, id],
				"zipped": True,
			},
			"output": OUTPUT
		}))

		patch = next((m["patch"] for m in released_modules if m["id"] == id), 0)
		module["name"] = meta.get("module_name", id)
		module["description"] = meta.get("site_description", "")
		module["categories"] = meta.get("site_categories", [])
		module["hidden"] = meta.get("hidden", False)
		module["patch"] = patch + 1
		print(id)

	with open(f"{OUTPUT}/modules.json", "w") as f:
		json.dump([m for m in modules if m.get("id") is not None], f, indent=2)
		f.write('\n')
