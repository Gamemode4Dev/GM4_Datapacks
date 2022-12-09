import click
import json
from beet import Project
from beet.toolchain.cli import beet
from beet.toolchain.commands import watch

pass_project = click.make_pass_decorator(Project) # type: ignore

@beet.command()
@pass_project
@click.pass_context
@click.argument("modules", nargs=-1)
@click.option("-r", "--reload", is_flag=True, help="Enable live data pack reloading.")
@click.option("-l", "--link", metavar="WORLD", help="Link the project before watching.")
def dev(ctx: click.Context, project: Project, modules: tuple[str], reload: bool, link: str | None):
	"""Watch modules for development."""

	modules = tuple(m if m.startswith("gm4_") else f"gm4_{m}" for m in modules)
	if len(modules) == 0:
		click.echo("[GM4] You need at least one module")
		return
	click.echo(f"[GM4] Building modules: {', '.join(modules)}")

	project.config_path = "beet-dev.yaml"
	config = {
		"broadcast": modules,
		"extend": "beet.yaml",
		"pipeline": [
			"gm4.plugins.create_description",
			"gm4.plugins.output"
		]
	}
	project.config_overrides = [f"pipeline[] = {json.dumps(config)}"]
	ctx.invoke(watch, reload=reload, link=link)
