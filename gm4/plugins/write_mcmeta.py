from beet import Context
from gm4.utils import run, NoneAttribute
from gm4.plugins.manifest import ManifestCacheModel

def beet_default(ctx: Context):
	"""Writes the pack.mcmeta based on the module name and version."""
	yield # wait for exit phase

	manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
	manifest_entry = {v.id:v for v in (manifest.modules|manifest.libraries).values()}.get(ctx.project_id, NoneAttribute())

	ctx.data.pack_format = 61
	ctx.data.supported_formats = {"min_inclusive": 48, "max_inclusive": 61}
	ctx.assets.pack_format = 46
	ctx.assets.supported_formats = {"min_inclusive": 34, "max_inclusive": 46}

	for pack in ctx.packs:
		pack.description = [
			ctx.project_name,
			"\n",
			{
				"text": f"Gamemode 4 for 1.21 - 1.21.4",
				"color": "#4AA0C7"
			}
		]
		pack.mcmeta.data.update({
			"version":manifest_entry.version,
			"commit_hash": run(["git", "log", "-1", "--format=%h"])
		})
