from beet.toolchain.helpers import subproject
from beet import Context

BASE = "base"
OUTPUT = "out"

def build_modules(ctx: Context):
	modules = [p.name for p in ctx.directory.glob("gm4_*")]
	print(f"[GM4] Found {len(modules)} modules")

	for module in modules:
		ctx.require(subproject({
			"id": module,
			"data_pack": {
				"name": module,
				"load": [BASE, module],
				"zipped": True,
			},
			"output": OUTPUT
		}))
		print(module)

	with open(f"{OUTPUT}/modules.txt", "w") as f:
		f.write("\n".join(modules))
		f.write('\n')
