from beet import Context
from gm4.utils import run, NoneAttribute
from gm4.plugins.manifest import ManifestCacheModel

def beet_default(ctx: Context):
	"""Writes the pack.mcmeta based on the module name and version."""
	yield # wait for exit phase

	manifest = ManifestCacheModel.model_validate(ctx.cache["gm4_manifest"].json)
	manifest_entry = {v.id:v for v in (manifest.modules|manifest.libraries).values()}.get(ctx.project_id, NoneAttribute())

	ctx.data.min_format = 99
	ctx.data.max_format = 99

	ctx.assets.min_format = 80
	ctx.assets.max_format = 80

	for pack in ctx.packs:
		pack.description = [
			ctx.project_name,
			"\n",
			{
				"text": f"Gamemode 4 for 26.1",
				"color": "#4AA0C7"
			}
		]
		pack.mcmeta.data.update({
			"version":manifest_entry.version,
			"commit_hash": run(["git", "log", "-1", "--format=%h"])
		})
