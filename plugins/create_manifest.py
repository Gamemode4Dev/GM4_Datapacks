from beet import Context
from typing import Any
import json
import os
import subprocess
import yaml


def run(cmd: list[str]) -> str:
	return subprocess.run(cmd, capture_output=True, encoding="utf8").stdout.strip()


def beet_default(ctx: Context):
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
