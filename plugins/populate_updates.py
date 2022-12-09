from beet import Context

def beet_default(ctx: Context):
	init = ctx.data.functions.get(f"{ctx.project_id}:init", None)
	if init is None:
		return

	if "#$moduleUpdateList" in init.lines:
		init.lines.remove("#$moduleUpdateList")

	manifest = ctx.cache["gm4_manifest"].json
	modules = manifest["modules"]

	init.lines.append("# Module update list")
	init.lines.append("data remove storage gm4:log queue[{type:'outdated'}]")
	for m in modules:
		init.lines.append(f"execute if score {m['id'].removeprefix('gm4_')} gm4_modules matches ..{m['patch'] - 1} run data modify storage gm4:log queue append value {{type:'outdated',module:'{m['name']}'}}")
