from beet import Context
from pathlib import Path
import os
import json
import requests
import shutil
from gm4.util import run

MODRINTH_API = "https://api.modrinth.com/v2"
AUTH_TOKEN_KEY = "BEET_MODRINTH_TOKEN"
SUPPORTED_GAME_VERSIONS = ["1.19", "1.19.1", "1.19.2", "1.19.3"]


def beet_default(ctx: Context):
	"""Saves the datapack to the ./out folder."""
	version = os.getenv("VERSION", "1.19")
	out_dir = Path("out")

	ctx.data.save(
		path=out_dir / f"{ctx.project_id}_{version.replace('.', '_')}",
		overwrite=True,
	)


def release(ctx: Context):
	"""
	Saves the zipped datapack and metadata to the ./release/{version} folder.
	
	If the module has the `version` and `meta.modrinth.project_id` fields, and
	`BEET_MODRINTH_TOKEN` environment variable is set, will try to publish a
	new version to Modrinth if it doesn't already exist.
	"""
	version = os.getenv("VERSION", "1.19")
	release_dir = Path("release") / version
	file_name = f"{ctx.project_id}_{version.replace('.', '_')}.zip"
	
	ctx.data.save(
		path=release_dir / file_name,
		overwrite=True,
		zipped=True,
	)

	base_path = release_dir / ctx.project_id
	os.makedirs(base_path, exist_ok=True)
	for file in ["README.md", "CREDITS.md", "pack.png"]:
		if file in ctx.data.extra:
			ctx.data.extra[file].dump(base_path, file)

	# Publish to modrinth
	modrinth = ctx.meta.get("modrinth", None)
	auth_token = os.getenv(AUTH_TOKEN_KEY, None)
	if modrinth and auth_token and ctx.project_version:
		modrinth_id = modrinth["project_id"]

		#TODO move patch retrieval to before pipeline broadcast, but with safeguards for if it fails to access?
		modules = ctx.cache['gm4_manifest'].json['modules']
		patch = next((m['patch'] for m in modules if m['id'] == ctx.project_id), 0)
		prefix = int(os.getenv("PATCH_PREFIX", 0))
		patched_version = ctx.project_version.replace('X', str(max(patch-prefix, 0)), 1)

		res = requests.get(f"{MODRINTH_API}/project/{modrinth_id}/version", headers={'Authorization': auth_token})
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				print(f"[GM4] Cannot publish to modrinth project {modrinth_id} as it doesn't exist.")
			else:
				print(f"[GM4] Failed to get project versions: {res.status_code} {res.text}")
			return
		project_data = res.json()
		matching_version = next((v for v in project_data if v["version_number"] == patched_version), None)
		if matching_version is not None:
			return

		with open(release_dir / file_name, "rb") as f:
			file_bytes = f.read()

		changelog = run(["git", "log", "-1", "--format=%s"])

		game_versions = modrinth.get("minecraft", SUPPORTED_GAME_VERSIONS)
		res = requests.post(f"{MODRINTH_API}/version", headers={'Authorization': auth_token}, files={
			"data": json.dumps({
				"name": f"{ctx.project_name} {patched_version}",
				"version_number": patched_version,
				"changelog": changelog,
				"dependencies": [],
				"game_versions": game_versions,
				"version_type": "release",
				"loaders": ["datapack"],
				"featured": False,
				"project_id": modrinth_id,
				"file_parts": [file_name],
			}),
			file_name: file_bytes,
		})
		if not (200 <= res.status_code < 300):
			print(f"[GM4] Failed to publish new version version: {res.status_code} {res.text}")
			return
		print(f"[GM4] Successfully published {res.json()['name']}")


def clear_release(ctx: Context):
	"""
	Empties the release folder preparing it to be overwritten. This makes sure that
	1. Deleted modules no longer stick around in the current version
	2. Changes to the build system (such as renamed files/folders) are properly reflected
	"""
	version = os.getenv("VERSION", "1.19")
	release_dir = Path("release") / version
	shutil.rmtree(release_dir, ignore_errors=True)
	os.makedirs(release_dir, exist_ok=True)
