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
	with open("meta.json", "r") as f:
		version_meta = json.load(f)
		prefix = version_meta["patch_prefix"]
		version = version_meta["version"]

	modules = [{"id": p.name} for p in ctx.directory.glob("gm4_*")]
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

	print(f"version={version}, HEAD={head}, last={last_commit}")
	for module in modules:
		id = module["id"]
		if last_commit:
			module["diff"] = run(["git", "diff", f"{last_commit}..HEAD", "--shortstat", "--", BASE, id])
			print(f"Gotten the diff: {module['diff']}")
		else:
			module["diff"] = True
		print(f"Module {id}: {module['diff']}")

	for module in modules:
		id = module["id"]

		try:
			with open(f"{id}/pack.mcmeta", "r") as f:
				meta: dict = json.load(f)
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

		released: dict | None = next((m for m in released_modules if m["id"] == id), None)
		if not module["diff"] and released:
			print(f"Keeping {id}, no changes")
			module.update(released)
			continue

		patch = released["patch"] if released else prefix
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
