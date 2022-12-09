from beet import Context


def beet_default(ctx: Context):
	modules = [p.name for p in sorted(ctx.directory.glob("gm4_*"))]
	print(f"[GM4] Found {len(modules)} modules")
