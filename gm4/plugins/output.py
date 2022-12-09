from beet import Context
from pathlib import Path
import os


def beet_default(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	out_dir = Path("out")

	ctx.data.save(
		path=out_dir / f"{ctx.project_id}_{version}",
		overwrite=True,
	)


def release(ctx: Context):
	version = os.getenv("VERSION", "1.19")
	release_dir = Path("release") / version

	ctx.data.save(
		path=release_dir / f"{ctx.project_id}_{version}.zip",
		overwrite=True,
		zipped=True,
	)

	base_path = release_dir / ctx.project_id
	os.makedirs(base_path, exist_ok=True)
	for file in ["README.md", "CREDITS.md", "pack.png"]:
		if file in ctx.data.extra:
			ctx.data.extra[file].dump(base_path, file)
