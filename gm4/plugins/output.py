from beet import Context
from pathlib import Path
import os
import json
import requests
import shutil
from gm4.utils import run

MODRINTH_API = "https://api.modrinth.com/v2"
MODRINTH_AUTH_KEY = "BEET_MODRINTH_TOKEN"
SMITHED_API = "https://api.smithed.dev/v2"
SMITHED_AUTH_KEY = "BEET_SMITHED_TOKEN"
SUPPORTED_GAME_VERSIONS = ["1.20"]
	# NOTE smithed only takes one game version number. Uses the first value in this list
USER_AGENT = "Gamemode4Dev/GM4_Datapacks/release-pipeline (gamemode4official@gmail.com)"

def beet_default(ctx: Context):
	"""Saves the datapack to the ./out folder."""
	version = os.getenv("VERSION", "1.20")
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

	Similarly, if the module has the `version` and `meta.smithed.pack_id` fields, and
	`BEET_SMITHED_TOKEN` environment variable is set, will try to publish a
	new version to Smithed if it doesn't already exist.
	"""
	version_dir = os.getenv("VERSION", "1.20")
	release_dir = Path("release") / version_dir
	file_name = f"{ctx.project_id}_{version_dir.replace('.', '_')}.zip"
	
	ctx.data.save(
		path=release_dir / file_name,
		overwrite=True,
		zipped=True,
	)

	generated_dir = release_dir / "generated"

	pack_icon_dir = generated_dir / "pack_icons"
	os.makedirs(pack_icon_dir, exist_ok=True)
	if "pack.png" in ctx.data.extra:
		ctx.data.extra["pack.png"].dump(pack_icon_dir, f"{ctx.project_id}.png")
	
	smithed_readme_dir = generated_dir / "smithed_readmes"
	os.makedirs(smithed_readme_dir, exist_ok=True)
	if "smithed_readme" in ctx.meta:
		ctx.meta['smithed_readme'].dump(smithed_readme_dir, f"{ctx.project_id}.md")

	# publish to download platforms
	publish_modrinth(ctx, release_dir, file_name)
	publish_smithed(ctx, release_dir, file_name)
		
def publish_modrinth(ctx: Context, release_dir: Path, file_name: str):
	'''Attempts to publish pack to modrinth'''
	modrinth = ctx.meta.get("modrinth", None)
	auth_token = os.getenv(MODRINTH_AUTH_KEY, None)
	if modrinth and auth_token:
		modrinth_id = modrinth["project_id"]
		
		# update page description
		res = requests.get(f"{MODRINTH_API}/project/{modrinth_id}", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT})
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				print(f"[GM4] [Modrinth] Cannot edit description of modrinth project {modrinth_id} as it doesn't exist.")
			else:
				print(f"[GM4] [Modrinth] Failed to get project: {res.status_code} {res.text}")
			return
		existing_readme = res.json()["body"]
		if existing_readme != (d:=ctx.meta['modrinth_readme'].text):
			res = requests.patch(f"{MODRINTH_API}/project/{modrinth_id}", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT}, json={"body": d})
			if not (200 <= res.status_code < 300):
				print(f"[GM4] [Modrinth] Failed to update description: {res.status_code} {res.text}")
			print(f"[GM4] [Modrinth] Successfully updated description of {ctx.project_name}")

		# upload datapack zip
		if ctx.project_version:
			version = ctx.cache["gm4_manifest"].json["modules"].get(ctx.project_id, {}).get("version", None)
			if version is None:
				print("[GM4] [Modrinth] Full version number not available in ctx.meta. Skipping publishing")
				return

			res = requests.get(f"{MODRINTH_API}/project/{modrinth_id}/version", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT})
			if not (200 <= res.status_code < 300):
				if res.status_code == 404:
					print(f"[GM4] [Modrinth] Cannot publish to modrinth project {modrinth_id} as it doesn't exist.")
				else:
					print(f"[GM4] [Modrinth] Failed to get project versions: {res.status_code} {res.text}")
				return
			project_data = res.json()
			matching_version = next((v for v in project_data if v["version_number"] == str(version)), None)
			if matching_version is not None:
				return

			with open(release_dir / file_name, "rb") as f:
				file_bytes = f.read()

			changelog = run(["git", "log", "-1", "--format=%s"])

			game_versions = modrinth.get("minecraft", SUPPORTED_GAME_VERSIONS)
			res = requests.post(f"{MODRINTH_API}/version", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT}, files={
				"data": json.dumps({
					"name": f"{ctx.project_name} v{version}",
					"version_number": version,
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
				print(f"[GM4] [Modrinth] Failed to publish new version version: {res.status_code} {res.text}")
				return
			print(f"[GM4] [Modrinth] Successfully published {res.json()['name']}")

def publish_smithed(ctx: Context, release_dir: Path, file_name: str):
	"""Attempts to publish pack to smithed"""
	smithed = ctx.meta.get("smithed", None)
	auth_token = os.getenv(SMITHED_AUTH_KEY, None)
	mc_version_dir = os.getenv("VERSION", "1.20")
	if smithed and auth_token and ctx.project_version:
		version = version = ctx.cache["gm4_manifest"].json["modules"].get(ctx.project_id, {}).get("version", None)
		smithed_id = smithed["pack_id"]

		# get project data and existing versions
		res = requests.get(f"{SMITHED_API}/packs/{smithed_id}")#/versions")
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				print(f"[GM4] [Smithed] Cannot publish to smithed project {smithed_id} as it doesn't exist.")
			else:
				print(f"[GM4] [Smithed] Failed to get project: {res.status_code} {res.text}")
			return
		
		project_data = res.json()
		
		# update description and pack image
			# ensures they point to the most up-to-date mc version branch
		project_display = project_data["display"]
		current_icon = f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/generated/pack_icons/{ctx.project_id}.png"
		current_readme = f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/generated/smithed_readmes/{ctx.project_id}.md"

		if project_display["icon"] != current_icon or project_display["webPage"] != current_readme:
			res = requests.patch(f"{SMITHED_API}/packs/{smithed_id}", params={'token': auth_token},
				json={"data": {
						"display": {
							"icon": current_icon,
							"webPage": current_readme,
						},
				}})
			if not (200 <= res.status_code < 300):
				print(f"[GM4] [Smithed] Failed to update descripion: {res.status_code} {res.text}")
			print(f"[GM4] [Smithed] {ctx.project_name} {res.text}")

		project_versions = project_data["versions"]
		matching_version = next((v for v in project_versions if v["name"] == str(version)), None)
		if matching_version is not None:
			return

		# remove other existing versions for that mc version
		mc_version_matching_version = (v["name"] for v in project_versions if v['supports'][0] == SUPPORTED_GAME_VERSIONS[0]) # NOTE smithed currently only supports one game version
		for v in mc_version_matching_version:
			res = requests.delete(f"{SMITHED_API}/packs/{smithed_id}/versions/{v}", params={'token': auth_token})
			if not (200 <= res.status_code < 300):
				print(f"[GM4] [Smithed] Failed to delete {ctx.project_name} version {v}: {res.status_code} {res.text}")
			else:
				print(f"[GM4] [Smithed] {ctx.project_name} {res.text}")
		
		# post new version
		res = requests.post(f"{SMITHED_API}/packs/{smithed_id}/versions",
		    params={'token': auth_token, 'version': version},
			json={"data":{
				"downloads":{
					"datapack": f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/{file_name}",
					"resourcepack": ""
				},
				"name": version,
				"supports": SUPPORTED_GAME_VERSIONS[0],
				"dependencies": []
			}}
		)
		if not (200 <= res.status_code < 300):
			print(f"[GM4] [Smithed] Failed to publish new version of {ctx.project_name}: {res.status_code} {res.text}")
			return
		print(f"[GM4] [Smithed] {ctx.project_name} {res.text}")



def clear_release(ctx: Context):
	"""
	Empties the release folder preparing it to be overwritten. This makes sure that
	1. Deleted modules no longer stick around in the current version
	2. Changes to the build system (such as renamed files/folders) are properly reflected
	"""
	version = os.getenv("VERSION", "1.20")
	release_dir = Path("release") / version
	shutil.rmtree(release_dir, ignore_errors=True)
	os.makedirs(release_dir, exist_ok=True)

def readmes(ctx: Context):
	"""Saves all READMEs intended for download sites to the ./out/readmes folder."""
	
	readme_dir = Path("out/readmes")
	base_path = readme_dir / ctx.project_id
	
	if "README.md" in ctx.data.extra:
		os.makedirs(base_path, exist_ok=True)
		ctx.data.extra["README.md"].dump(base_path, "GM4_README.md")
	else:
		print(f"[GM4] {ctx.project_id} has no README.md")

	for file, ext in {"modrinth_readme":"md", "smithed_readme":"md", "pmc_readme":"txt"}.items():
		if file in ctx.meta:
			ctx.meta[file].dump(base_path, f"{file.upper()}.{ext}")
