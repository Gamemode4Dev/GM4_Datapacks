import json
import logging
import os
import re
import sys
from pathlib import Path

import requests
from beet import Context, PackConfig, Project, ProjectBuilder
from beet.toolchain.config import load_config as beet_load_config

from gm4.plugins.manifest import ManifestCacheModel, ManifestConfig
from gm4.utils import NoneAttribute, Version, run

parent_logger = logging.getLogger("gm4.publish")


MODRINTH_API = "https://api.modrinth.com/v2"
MODRINTH_AUTH_KEY = "BEET_MODRINTH_TOKEN"
SMITHED_API = "https://api.smithed.dev/v2"
SMITHED_AUTH_KEY = "BEET_SMITHED_TOKEN"
USER_AGENT = "Gamemode4Dev/GM4_Datapacks/release-pipeline (gamemode4official@gmail.com)"

def beet_default(ctx: Context):
    """Published all module release .zips from VERSION/release to download sites

    If the module has the `version` and `meta.modrinth.project_id` fields, and
    `BEET_MODRINTH_TOKEN` environment variable is set, will try to publish a
    new version to Modrinth if it doesn't already exist.

    Similarly, if the module has the `version` and `meta.smithed.pack_id` fields, and
    `BEET_SMITHED_TOKEN` environment variable is set, will try to publish a
    new version to Smithed if it doesn't already exist."""

    version_dir = os.getenv("VERSION", "26.2")
    release_dir = Path("release") / version_dir

    corrected_project_id = stem if (stem:=ctx.directory.stem).startswith("lib") else ctx.project_id

    file_name = f"{corrected_project_id}_{version_dir.replace('.', '_')}.zip"
    
    config = ctx.validate("gm4", ManifestConfig)

    publish_to = ctx.cache["currently_publishing"].json.get("publish_to", None)
    
    # publish to download platforms, based on which gh job this is
    if publish_to == "smithed":
        publish_smithed(ctx, config, file_name)
    elif publish_to == "modrinth":
        publish_modrinth(ctx, config, release_dir, file_name)

# def dev_test_1(ctx: Context):
#     # print(f"beet cache restored as: {list(ctx.cache.keys())}")

#     # print(f"gm4_manifest is :{ctx.cache["gm4_manifest"]}")
#     print(ctx.meta.get("gm4"))

#     if ctx.meta.get("gm4",{}).get("publish_to", None) == "modrinth":
#         print(f"publishing to modrinth!")
#     else:
#         print(f"publishing to smithed")
#     pass

def switch_platform(ctx: Context):
    """Reads gm4.publish_to meta field to the cache, for subpipelines to check and run the correct publish plugin"""
    publish_to: str = ctx.meta.get("gm4", {}).get("publish_to", None)
    ctx.cache["currently_publishing"].json = {"publish_to": publish_to}

def load_config(ctx: Context):
    """Loads relavent fields from each module's beet.yaml, without inheriting the pipeline and running plugins"""

    config = beet_load_config(ctx.directory/"beet.yaml")

    config.require = []
    config.pipeline = ctx.meta.get("plugins", [])
    config.data_pack = PackConfig()
    config.resource_pack = PackConfig()

    # run the new list of plugins from beet-publish.yaml
    ctx.require(
        ProjectBuilder(
            Project(
                config,
                resolved_cache=ctx.cache
            )
        )
    )

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
                    if res.status_code == 401:
                        logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                        # sys.exit(1) # quit the build and mark the github action as failed
                    elif not (200 <= res.status_code < 300):
                        logger.warning(f"Failed to patch project versions: {res.status_code} {res.text}")
                return

            if len(config.minecraft) > 0:
                # supported versions is not empty, post new version
                with open(release_dir / file_name, "rb") as f:
                    file_bytes = f.read()

                changelog = run(["git", "log", "-1", "--format=%s"])
                changelog = re.sub(r"\(#(\d+)\)", "([#\\1](https://github.com/Gamemode4Dev/GM4_Datapacks/pull/\\1))", changelog)

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
                if res.status_code == 401:
                    logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                    # sys.exit(1) # quit the build and mark the github action as failed
                elif not (200 <= res.status_code < 300):
                    logger.warning(f"Failed to publish new version version: {res.status_code} {res.text}")
                    return
                logger.info(f"Successfully published {res.json()['name']}", extra={"gh_annotate_skip": True})


def publish_smithed(ctx: Context, config: ManifestConfig, file_name: str):
    """Attempts to publish pack to smithed"""
    auth_token = os.getenv(SMITHED_AUTH_KEY, None)
    logger = parent_logger.getChild(f"smithed.{ctx.project_id}")
    mc_version_dir = os.getenv("VERSION", "26.2")
    manifest = ManifestCacheModel.model_validate(ctx.cache["gm4_manifest"].json)
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
                if res.status_code == 401:
                    logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                    # sys.exit(1) # quit the build and mark the github action as failed
                elif not (200 <= res.status_code < 300):
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
                if res.status_code == 401:
                    logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                    # sys.exit(1) # quit the build and mark the github action as failed
                elif not (200 <= res.status_code < 300):
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
            if res.status_code == 401:
                logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                # sys.exit(1) # quit the build and mark the github action as failed
            elif not (200 <= res.status_code < 300):
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
            if res.status_code == 401:
                logger.critical(f"Authentication error, cancelling publish. Check token validity!: {res.status_code} {res.text}")
                # sys.exit(1) # quit the build and mark the github action as failed
            elif not (200 <= res.status_code < 300):
                logger.warning(f"Failed to publish new version of {ctx.project_name}: {res.status_code} {res.text}")
                return
            logger.info(f"{ctx.project_name} {res.text}", extra={"gh_annotate_skip": True})
