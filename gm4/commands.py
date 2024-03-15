import json
import logging
import os
import shutil
from pathlib import Path
from tempfile import NamedTemporaryFile
from typing import Any

import beet.toolchain.commands as commands
import click
import yaml
from beet import Project
from beet.toolchain.cli import beet

# NOTE pydantic.v1 does not allow reloading models with custom validators, which beet watch will do normally. 
# Importing them here prevents their reload on each watch cycle. This may change in pydantic.v2 - revisit then
from gm4.utils import MapOption  # type: ignore
from gm4.plugins.resource_pack import ModelData  # type: ignore

# import worker plugin to prevent 'worker reload' warnings
import gm4.plugins.worker # type: ignore

pass_project = click.make_pass_decorator(Project) # type: ignore

@beet.command()
@pass_project
@click.pass_context
@click.argument("modules", nargs=-1)
@click.option("-w", "--watch", is_flag=True, help="Watch the project directory and build on file changes.")
@click.option("-r", "--reload", is_flag=True, help="Enable live data pack reloading.")
@click.option("-l", "--link", metavar="WORLD", help="Link the project before watching.")
@click.option("-c", "--clean", is_flag=True, help="Clean the output folder.")
@click.option("--log", default="INFO", type=str, help="Set the logger level")
def dev(ctx: click.Context, project: Project, modules: tuple[str, ...], watch: bool, reload: bool, link: str | None, clean: bool, log: int | str):
	"""Build or watch modules for development."""

	modules = tuple(m if m.startswith("gm4_") else f"gm4_{m}" for m in modules)
	if len(modules) == 0:
		click.echo("[GM4] You need at least one module")
		return

	if clean:
		click.echo(f"[GM4] Cleaning output folder...")
		shutil.rmtree("out", ignore_errors=True)

	click.echo(f"[GM4] Building modules: {', '.join(modules)}")

	logger = logging.getLogger()
	logger.setLevel(log)
	# logger.addHandler(LogHandler()) # TODO configure the log handler to GM4's preferred formatting

	config = yaml.safe_load(Path("beet-dev.yaml").read_text())

	# command-determined config options
	broadcast_config: dict[str, Any] = next((p for p in config["pipeline"] if isinstance(p, dict))) # type: ignore
	broadcast_config["broadcast"] = modules
	if reload:
		broadcast_config["require"].insert(0, "beet.contrib.livereload")

	build_dynamic_config(config, ctx, project, watch, link) # start the project build


@beet.command()
def clean():
	"""Cleans the output folder."""
	shutil.rmtree("out", ignore_errors=True)
	shutil.rmtree("release", ignore_errors=True)
	click.echo(f"[GM4] Cleaned output and release folder!")


@beet.command()
@pass_project
@click.pass_context
@click.argument("modules", nargs=-1)
@click.option("-w", "--watch", is_flag=True, help="Watch the project directory and build on file changes.")
@click.option("-c", "--clean", is_flag=True, help="Clean the output folder.")
def readme_gen(ctx: click.Context, project: Project, modules: tuple[str, ...], watch: bool, clean: bool):
	"""Generates all README files for manual uplaoad"""
	
	modules = tuple(m if m.startswith("gm4_") else f"gm4_{m}" for m in modules)
	if len(modules) == 0:
		click.echo("[GM4] You need at least one module")
		return
	
	if clean:
		click.echo(f"[GM4] Cleaning output folder...")
		shutil.rmtree("out", ignore_errors=True)
	
	click.echo(f"[GM4] Generating READMEs for: {', '.join(modules)}")

	# we want to only read in the metadata from each project fo make a readme, not run the whole build pipeline
		# so we have to manually expand the broadcast instead of relying on beet's broadcast option.
	subprojects: list[dict[str,Any]] = []
	for module in modules:
		module_config = yaml.safe_load(Path(f"{module}/beet.yaml").read_text())
		for key in ["data_pack", "resource_pack", "pipeline", "require"]: # remove pack resources
			module_config.pop(key, None)
		module_config["pipeline"] = [
			"gm4.plugins.manifest.write_credits",
			"gm4.plugins.readme_generator",
			"gm4.plugins.output.readmes"
		]
		subprojects.append(module_config)

	config = {
		"pipeline": [
			*subprojects,
			"gm4.plugins.finished"
		],
		"meta": {
			"autosave": {
				"link": False
			}
		}
	}

	build_dynamic_config(config, ctx, project, watch, link=None)


def build_dynamic_config(config: dict[str,Any], ctx: click.Context, project: Project, watch: bool, link: str|None):
	"""Creates a tempfile on disk to pass to beet. Enables runtime dynamic setup of the build process that is compatiable with `beet watch`"""

	config["directory"] = str(project.directory) # set working directory to where CLI was invoked

	with NamedTemporaryFile(mode="wt", delete=False, suffix=".json") as f:
		project.config_path = f.name
		json.dump(config, f, indent=1)

	project.reset() # delete previously resolved config
	ctx.invoke(commands.watch if watch else commands.build, link=link)
	os.remove(f.name) # delete tempfile
