from beet import Context
import os


def beet_default(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	ctx.data.save(
		path=f"out/{ctx.project_id}_{version}",
		overwrite=True,
	)


def release(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	base_path = f"release/{version}/{ctx.project_id}"
	ctx.data.save(
		path=f"{base_path}_{version}.zip",
		overwrite=True,
		zipped=True,
	)

	os.makedirs(base_path, exist_ok=True)
	for file in ["README.md", "CREDITS.md", "pack.png"]:
		if file in ctx.data.extra:
			ctx.data.extra[file].dump(base_path, file)
