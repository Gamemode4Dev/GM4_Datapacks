from beet import Context
import os
from gm4.utils import run

def beet_default(ctx: Context):
	"""Writes the pack.mcmeta description based on the module name and version."""
	version = os.getenv("VERSION", "1.19")
	ctx.data.description = [
		ctx.project_name,
		"\n",
		{
			"text": f"Gamemode 4 for {version}",
			"color": "#4AA0C7"
		}
	]
	ctx.data.mcmeta.data.update({
		"version": next((m.get("version") for m in ctx.cache["gm4_manifest"].json["modules"] if m["id"] == ctx.project_id), None),
		"commit_hash": run(["git", "log", "-1", "--format=%h"])
	})
