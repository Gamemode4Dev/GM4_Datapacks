from beet import Context
import os

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
