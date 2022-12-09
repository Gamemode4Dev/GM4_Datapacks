from beet import Context
import os


def beet_default(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	ctx.data.save(
		path=f"out/{ctx.project_id}_{version}",
		overwrite=True,
	)
