from beet import Context
from pathlib import Path
import os
import shutil
import logging


parent_logger = logging.getLogger("gm4.output")


def beet_default(ctx: Context):
	"""Saves the datapack to the ./out folder in it's exit phase.
	 	Should be first in pipeline to properly wrap all other plugins cleanup phases"""
	version = os.getenv("VERSION", "26.2")
	out_dir = Path("out")

	yield # wait for exit phase, after other plugins cleanup

	ctx.data.save(
		path=out_dir / f"{ctx.project_id}_{version.replace('.', '_')}",
		overwrite=True,
	)

def resource_pack(ctx: Context):
	"""Saves the resourcepack to the ./out folder."""
	version = os.getenv("VERSION", "26.2")
	out_dir = Path("out")

	ctx.assets.save(
		path=out_dir / f"gm4_resource_pack_{version.replace('.', '_')}",
		overwrite=True
	)

def release_resource_pack(ctx: Context):
	"""Saves the resourcepack to the ./out folder."""
	version = os.getenv("VERSION", "26.2")
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
	"""
	version_dir = os.getenv("VERSION", "26.2")
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


def clear_release(ctx: Context):
	"""
	Empties the release folder preparing it to be overwritten. This makes sure that
	1. Deleted modules no longer stick around in the current version
	2. Changes to the build system (such as renamed files/folders) are properly reflected
	"""
	version = os.getenv("VERSION", "26.2")
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
