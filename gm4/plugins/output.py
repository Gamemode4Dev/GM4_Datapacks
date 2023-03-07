from beet import Context
from pathlib import Path
import os
import json
import requests
import shutil

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
			
	if "smithed_readme" in ctx.meta:
		ctx.meta['smithed_readme'].dump(base_path, "SMITHED_README.md")

	# Publish to modrinth
	modrinth = ctx.meta.get("modrinth", None)
	auth_token = os.environ.get(AUTH_TOKEN_KEY, None)
	if modrinth and auth_token and ctx.project_version:
		modrinth_id = modrinth["project_id"]

		res = requests.get(f"{MODRINTH_API}/project/{modrinth_id}/version", headers={'Authorization': auth_token})
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				print(f"[GM4] Cannot publish to modrinth project {modrinth_id} as it doesn't exist.")
			else:
				print(f"[GM4] Failed to get project versions: {res.status_code} {res.text}")
			return
		project_data = res.json()
		matching_version = next((v for v in project_data if v["version_number"] == ctx.project_version), None)
		if matching_version is not None:
			return

		with open(release_dir / file_name, "rb") as f:
			file_bytes = f.read()

		game_versions = modrinth.get("minecraft", SUPPORTED_GAME_VERSIONS)
		res = requests.post(f"{MODRINTH_API}/version", headers={'Authorization': auth_token}, files={
			"data": json.dumps({
				"name": f"{ctx.project_name} {ctx.project_version}",
				"version_number": ctx.project_version,
				"dependencies": [],
				"game_versions": game_versions,
				"version_type": "release",
				"loaders": ["minecraft"],
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

def readmes(ctx: Context):
	"""Saves all READMEs intended for download sites to the ./out/readmes folder."""
	
	readme_dir = Path("out/readmes")
	base_path = readme_dir / ctx.project_id
	os.makedirs(base_path, exist_ok=True)
	
	if "README.md" in ctx.data.extra:
		ctx.data.extra["README.md"].dump(base_path, "GM4_README.md")

	for file, ext in {"modrinth_readme":"md", "smithed_readme":"md", "pmc_readme":"txt"}.items():
		if file in ctx.meta:
			ctx.meta[file].dump(base_path, f"{file.upper()}.{ext}")
