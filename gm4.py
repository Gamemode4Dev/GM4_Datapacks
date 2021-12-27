from beet.toolchain.helpers import subproject
from beet import Context
import json
import os
import subprocess

BASE = "base"
OUTPUT = "out"
RELEASE = "release"


def run(cmd: list[str]) -> str:
	print("Run", cmd)
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()


def build_modules(ctx: Context):
	modules = [{"id": p.name} for p in ctx.directory.glob("gm4_*")]
	print(f"[GM4] Found {len(modules)} modules")
	print(modules)

	branch = os.getenv("GITHUB_REF_NAME")
	released_meta = f"{RELEASE}/{branch}/meta.json" if branch else "out/meta.json"
	head = run(["git", "rev-parse", "HEAD"])
	print(f"On branch {branch}, HEAD={head}")
	try:
		with open(released_meta, "r") as f:
			meta = json.load(f)
			released_modules = meta["modules"]
			last_commit = meta["last_commit"]
	except:
		released_modules = []
		last_commit = None

	print(f"Last update: {last_commit}")
	for module in modules:
		id = module["id"]
		if last_commit:
			module["diff"] = run(["git", "diff", last_commit, "--shortstat", "--", "{BASE}", id])
			print(f"Gotten the diff: {module['diff']}")
		else:
			module["diff"] = True
		print(f"Module {id}: {module['diff']}")

	for module in modules:
		id = module["id"]
		if not module["diff"]:
			print(f"Keeping {id}, no changes")
			released_module = next((m for m in released_modules if m["id"] == id), None)
			if released_module:
				module.update(released_module)
			else:
				module["id"] = None
			continue

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
		print(f"Updated {id}")

	os.makedirs(OUTPUT, exist_ok=True)
	with open(f"{OUTPUT}/meta.json", "w") as f:
		out = {
			"last_commit": head,
			"modules": [m for m in modules if m.get("id") is not None],
		}
		json.dump(out, f, indent=2)
		f.write('\n')
