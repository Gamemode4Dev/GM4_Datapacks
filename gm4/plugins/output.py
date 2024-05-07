from beet import Context
from pathlib import Path
import os
import json
import requests
import shutil
import logging
from gm4.utils import run, Version, NoneAttribute
from gm4.plugins.manifest import ManifestConfig, ManifestCacheModel

parent_logger = logging.getLogger("gm4.output")

MODRINTH_API = "https://api.modrinth.com/v2"
MODRINTH_AUTH_KEY = "BEET_MODRINTH_TOKEN"
SMITHED_API = "https://api.smithed.dev/v2"
SMITHED_AUTH_KEY = "BEET_SMITHED_TOKEN"
USER_AGENT = "Gamemode4Dev/GM4_Datapacks/release-pipeline (gamemode4official@gmail.com)"


def beet_default(ctx: Context):
	"""Saves the datapack to the ./out folder in it's exit phase.
	 	Should be first in pipeline to properly wrap all other plugins cleanup phases"""
	version = os.getenv("VERSION", "1.20.5")
	out_dir = Path("out")

	yield # wait for exit phase, after other plugins cleanup
	
	ctx.data.save(
		path=out_dir / f"{ctx.project_id}_{version.replace('.', '_')}",
		overwrite=True,
	)

def resource_pack(ctx: Context):
	"""Saves the resourcepack to the ./out folder."""
	version = os.getenv("VERSION", "1.20.5")
	out_dir = Path("out")

	ctx.assets.save(
		path=out_dir / f"gm4_resource_pack_{version.replace('.', '_')}",
		overwrite=True
	)

def release_resource_pack(ctx: Context):
	"""Saves the resourcepack to the ./out folder."""
	version = os.getenv("VERSION", "1.20.5")
	release_dir = Path("release") / version

	yield

	ctx.assets.save(
		path=release_dir / f"gm4_resource_pack_{version.replace('.', '_')}.zip",
		overwrite=True,
		zipped=True
	)


def test(ctx: Context):
	"""Saves the zipped datapack to the ./out folder in it's exit phase.
	 	Should be first in pipeline to properly wrap all other plugins cleanup phases"""
	out_dir = Path("out")

	yield # wait for exit phase, after other plugins cleanup

	ctx.data.save(
		path=out_dir / ctx.project_id,
		overwrite=True,
		zipped=True,
	)


def release(ctx: Context):
	"""
	Saves the zipped datapack and metadata to the ./release/{version} folder.
		Should be first in pipeline to properly wrap all other plugins cleanup phases
	
	If the module has the `version` and `meta.modrinth.project_id` fields, and
	`BEET_MODRINTH_TOKEN` environment variable is set, will try to publish a
	new version to Modrinth if it doesn't already exist.

	Similarly, if the module has the `version` and `meta.smithed.pack_id` fields, and
	`BEET_SMITHED_TOKEN` environment variable is set, will try to publish a
	new version to Smithed if it doesn't already exist.
	"""
	version_dir = os.getenv("VERSION", "1.20.5")
	release_dir = Path("release") / version_dir

	corrected_project_id = stem if (stem:=ctx.directory.stem).startswith("lib") else ctx.project_id

	file_name = f"{corrected_project_id}_{version_dir.replace('.', '_')}.zip"

	yield # wait for exit phase, after other plugins cleanup
	
	ctx.data.save(
		path=release_dir / file_name,
		overwrite=True,
		zipped=True,
	)

	generated_dir = release_dir / "generated"

	pack_icon_dir = generated_dir / "pack_icons"
	os.makedirs(pack_icon_dir, exist_ok=True)
	if "pack.png" in ctx.data.extra:
		ctx.data.extra["pack.png"].dump(pack_icon_dir, f"{corrected_project_id}.png")
	
	smithed_readme_dir = generated_dir / "smithed_readmes"
	os.makedirs(smithed_readme_dir, exist_ok=True)
	if "smithed_readme" in ctx.meta:
		ctx.meta['smithed_readme'].dump(smithed_readme_dir, f"{corrected_project_id}.md")

	config = ctx.validate("gm4", ManifestConfig)

	# publish to download platforms
	publish_modrinth(ctx, config, release_dir, file_name)
	publish_smithed(ctx, config, file_name)


def publish_modrinth(ctx: Context, config: ManifestConfig, release_dir: Path, file_name: str):
	'''Attempts to publish pack to modrinth'''
	auth_token = os.getenv(MODRINTH_AUTH_KEY, None)
	logger = parent_logger.getChild(f"modrinth.{ctx.project_id}")
	if config.modrinth and auth_token:
		# update page description
		res = requests.get(f"{MODRINTH_API}/project/{config.modrinth.project_id}", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT})
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				logger.warning(f"Cannot edit description of modrinth project {config.modrinth.project_id} as it doesn't exist.")
			else:
				logger.warning(f"Failed to get project: {res.status_code} {res.text}")
			return
		existing_readme = res.json()["body"]
		if existing_readme != (d:=ctx.meta['modrinth_readme'].text):
			logger.debug("Readme and modrinth-page content differ. Updating webpage body")
			res = requests.patch(f"{MODRINTH_API}/project/{config.modrinth.project_id}", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT}, json={"body": d})
			if not (200 <= res.status_code < 300):
				logger.warning(f"Failed to update description: {res.status_code} {res.text}")
			logger.info(f"Successfully updated description of {ctx.project_name}", extra={"gh_annotate_skip": True})

		# upload datapack zip
		if ctx.project_version:
			version = ctx.cache["gm4_manifest"].json["modules"].get(ctx.project_id, {}).get("version", None)
			if version is None:
				logger.warning("Full version number not available in ctx.meta. Skipping publishing")
				return

			res = requests.get(f"{MODRINTH_API}/project/{config.modrinth.project_id}/version", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT})
			if not (200 <= res.status_code < 300):
				if res.status_code == 404:
					logger.warning(f"Cannot publish to modrinth project {config.modrinth.project_id} as it doesn't exist.")
				else:
					logger.warning(f"Failed to get project versions: {res.status_code} {res.text}")
				return
			project_data = res.json()

			matching_version = next((v for v in project_data if v["version_number"] == str(version)), None)
			if matching_version is not None: # patch version already exists
				# update mc versions if necessary
				if len(config.minecraft) > 0 and not set(matching_version["game_versions"]) == set(config.minecraft):
					# supported versions has changed and is not empty
					logger.debug("Additional MC version support has been added to an existing patch version. Updating existing modrinth version data")
					res = requests.patch(f"{MODRINTH_API}/version/{matching_version['id']}", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT}, json={
						"game_versions": config.minecraft
					})
					if not (200 <= res.status_code < 300):
						logger.warning(f"Failed to patch project versions: {res.status_code} {res.text}")
				return

			if len(config.minecraft) > 0:
				# supported versions is not empty, post new version
				with open(release_dir / file_name, "rb") as f:
					file_bytes = f.read()

				changelog = run(["git", "log", "-1", "--format=%s"])

				res = requests.post(f"{MODRINTH_API}/version", headers={'Authorization': auth_token, 'User-Agent': USER_AGENT}, files={
					"data": json.dumps({
						"name": f"{ctx.project_name} v{version}",
						"version_number": version,
						"changelog": changelog,
						"dependencies": [],
						"game_versions": config.minecraft,
						"version_type": "release",
						"loaders": ["datapack"],
						"featured": False,
						"project_id": config.modrinth.project_id,
						"file_parts": [file_name],
					}),
					file_name: file_bytes,
				})
				if not (200 <= res.status_code < 300):
					logger.warning(f"Failed to publish new version version: {res.status_code} {res.text}")
					return
				logger.info(f"Successfully published {res.json()['name']}", extra={"gh_annotate_skip": True})


def publish_smithed(ctx: Context, config: ManifestConfig, file_name: str):
	"""Attempts to publish pack to smithed"""
	auth_token = os.getenv(SMITHED_AUTH_KEY, None)
	logger = parent_logger.getChild(f"smithed.{ctx.project_id}")
	mc_version_dir = os.getenv("VERSION", "1.20.5")
	manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
	project_id = stem if (stem:=ctx.directory.stem).startswith("lib") else ctx.project_id

	if config.smithed and auth_token:
		version = (manifest.modules|manifest.libraries).get(project_id, NoneAttribute()).version or ""

		# get project data and existing versions
		res = requests.get(f"{SMITHED_API}/packs/{config.smithed.pack_id}")
		if not (200 <= res.status_code < 300):
			if res.status_code == 404:
				logger.warning(f"Cannot publish to smithed project {config.smithed.pack_id} as it doesn't exist.")
			else:
				logger.warning(f"Failed to get project: {res.status_code} {res.text}")
			return
		
		project_data = res.json()

		# update description and pack image
			# ensures they point to the most up-to-date mc version branch
		project_versions = project_data["versions"]
		newest_version = sorted([Version(v["name"]) for v in project_versions])[-1]
		if Version(version) > newest_version: # only update the description if we're not patching an old version
			project_display = project_data["display"]
			current_icon = f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/generated/pack_icons/{project_id}.png"
			current_readme = f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/generated/smithed_readmes/{project_id}.md"

			if project_display["icon"] != current_icon or project_display["webPage"] != current_readme:
				logger.debug("Pack Icon or Readme hyperlink is incorrect. Updating project")
				res = requests.patch(f"{SMITHED_API}/packs/{config.smithed.pack_id}", params={'token': auth_token},
					json={"data": {
							"display": {
								"icon": current_icon,
								"webPage": current_readme,
							},
					}})
				if not (200 <= res.status_code < 300):
					logger.warning(f"Failed to update descripion: {res.status_code} {res.text}")
				logger.info(f"{ctx.project_name} {res.text}", extra={"gh_annotate_skip": True})

		matching_version = next((v for v in project_versions if v["name"] == str(version)), None)
		if matching_version is not None: # patch version already exists
			# update MC version if necessary
			if len(config.minecraft) > 0 and not set(matching_version["supports"]) == set(config.minecraft):
				# supported versions has changed and is not empty
				logger.debug("Additional MC version support has been added to an existing patch version. Updating existing smithed version data")
				res = requests.patch(f"{SMITHED_API}/packs/{config.smithed.pack_id}/versions/{matching_version['name']}", params={'token': auth_token}, json={
					"data": {
						"supports": config.minecraft
					}
				})
				if not (200 <= res.status_code < 300):
					logger.warning(f"Failed to patch project versions: {res.status_code} {res.text}")
			return

		# permalink previous version (in that MC version) to the git history
		commit_hash = run("cd release && git log -1 --format=%H")
		matching_mc_versions = sorted((Version(v["name"]) for v in project_versions if set(v['supports']) & set(config.minecraft)))
		prior_version_in_mc_version = matching_mc_versions[-1] if len(matching_mc_versions) > 0 else None # newest version number, with any MC overlap
		prior_url: str = next((v["downloads"]["datapack"] for v in project_versions if Version(v["name"]) == prior_version_in_mc_version), "")
		if "https://github.com/Gamemode4Dev/GM4_Datapacks/blob/" not in prior_url and prior_version_in_mc_version:
			res = requests.patch(f"{SMITHED_API}/packs/{config.smithed.pack_id}/versions/{prior_version_in_mc_version}", params={'token': auth_token}, json={
				"data":{
					"downloads": {
					"datapack": f"https://github.com/Gamemode4Dev/GM4_Datapacks/blob/{commit_hash}/{mc_version_dir}/{file_name}?raw=true",
					"resourcepack": ""
					}
				}
			})
			if not (200 <= res.status_code < 300):
				logger.warning(f"Failed to permalink {project_id} version {prior_version_in_mc_version}: {res.status_code} {res.text}")
			else:
				logger.info(f"Permalinked {project_id} {prior_version_in_mc_version} to git history: {res.text}", extra={"gh_annotate_skip": True})

		if len(config.minecraft) > 0:
			# supported versions is not empty, post new version
			res = requests.post(f"{SMITHED_API}/packs/{config.smithed.pack_id}/versions",
					params={'token': auth_token, 'version': version},
				json={"data":{
					"downloads":{
						"datapack": f"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/release/{mc_version_dir}/{file_name}",
						"resourcepack": ""
					},
					"name": version,
					"supports": config.minecraft,
					"dependencies": []
				}}
			)
			if not (200 <= res.status_code < 300):
				logger.warning(f"Failed to publish new version of {ctx.project_name}: {res.status_code} {res.text}")
				return
			logger.info(f"{ctx.project_name} {res.text}", extra={"gh_annotate_skip": True})


def clear_release(ctx: Context):
	"""
	Empties the release folder preparing it to be overwritten. This makes sure that
	1. Deleted modules no longer stick around in the current version
	2. Changes to the build system (such as renamed files/folders) are properly reflected
	"""
	version = os.getenv("VERSION", "1.20.5")
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
		parent_logger.info(f"[GM4] {ctx.project_id} has no README.md")

	for file, ext in {"modrinth_readme":"md", "smithed_readme":"md", "pmc_readme":"txt"}.items():
		if file in ctx.meta:
			ctx.meta[file].dump(base_path, f"{file.upper()}.{ext}")
