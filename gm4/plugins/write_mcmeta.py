from beet import Context
import os
from gm4.utils import run, NoneAttribute
from gm4.plugins.manifest import ManifestCacheModel

def beet_default(ctx: Context):
	"""Writes the pack.mcmeta based on the module name and version."""
	version = os.getenv("VERSION", "1.20")
	ctx.data.pack_format = 15 # manually set as beet's `latest` is not available for 1.20 at this time.
	ctx.data.description = [
		ctx.project_name,
		"\n",
		{
			"text": f"Gamemode 4 for {version}",
			"color": "#4AA0C7"
		}
	]
	manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
	manifest_entry = (manifest.modules|{v.id:v for v in manifest.libraries.values()}).get(ctx.project_id, NoneAttribute())
	ctx.data.mcmeta.data.update({
		"version":manifest_entry.version,
		"commit_hash": run(["git", "log", "-1", "--format=%h"])
	})
