import click
import json
import shutil
from beet import Project
from beet.toolchain.cli import beet
import beet.toolchain.commands as commands

pass_project = click.make_pass_decorator(Project) # type: ignore

@beet.command()
@pass_project
@click.pass_context
@click.argument("modules", nargs=-1)
@click.option("-w", "--watch", is_flag=True, help="Watch the project directory and build on file changes.")
@click.option("-r", "--reload", is_flag=True, help="Enable live data pack reloading.")
@click.option("-l", "--link", metavar="WORLD", help="Link the project before watching.")
@click.option("-c", "--clean", is_flag=True, help="Clean the output folder.")
def dev(ctx: click.Context, project: Project, modules: tuple[str], watch: bool, reload: bool, link: str | None, clean: bool):
	"""Build or watch modules for development."""

	modules = tuple(m if m.startswith("gm4_") else f"gm4_{m}" for m in modules)
	if len(modules) == 0:
		click.echo("[GM4] You need at least one module")
		return

	if clean:
		click.echo(f"[GM4] Cleaning output folder...")
		shutil.rmtree("out", ignore_errors=True)

	click.echo(f"[GM4] Building modules: {', '.join(modules)}")

	project.config_path = "beet-dev.yaml"
	config = {
		"broadcast": modules,
		"extend": "beet.yaml",
		"require": ["beet.contrib.livereload"] if reload else [],
		"pipeline": [
			"gm4.plugins.write_mcmeta",
			"gm4.plugins.versioning.module_load_advancements",
			"gm4.plugins.output"
		]
	}
	project.config_overrides = [
		f"pipeline[] = {json.dumps(config)}",
		f"pipeline[] = gm4.plugins.finished",
	]

	ctx.invoke(commands.watch if watch else commands.build, link=link)


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
def readme_gen(ctx: click.Context, project: Project, modules: tuple[str], watch: bool, clean: bool):
	"""Generates all README files for manual uplaoad"""
	
	modules = tuple(m if m.startswith("gm4_") else f"gm4_{m}" for m in modules)
	if len(modules) == 0:
		click.echo("[GM4] You need at least one module")
		return
	
	if clean:
		click.echo(f"[GM4] Cleaning output folder...")
		shutil.rmtree("out", ignore_errors=True)
	
	click.echo(f"[GM4] Generating READMEs for: {', '.join(modules)}")

	project.config_path = "beet-dev.yaml"
	config = {
		"broadcast": modules,
		"extend": "beet.yaml",
		"meta": {"readme-gen": True},
		"pipeline": [
			"gm4.plugins.manifest.write_credits",
			"gm4.plugins.readme_generator",
			"gm4.plugins.output.readmes"
		]
	}

	project.config_overrides = [
		f"pipeline[] = gm4.plugins.manifest.create",
		f"pipeline[] = {json.dumps(config)}",
		f"pipeline[] = gm4.plugins.finished",
	]

	ctx.invoke(commands.watch if watch else commands.build)
