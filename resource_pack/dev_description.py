from beet import Context

def beet_default(ctx: Context):
    ctx.assets.description = [
			"Merged Developer Resources\n",
			{
				"text": f"Development Only!",
				"color": "red"
			}
		]
    ctx.assets.supported_formats = {"min_inclusive": 55, "max_inclusive": 75}
    ctx.assets.pack_format = 55
    ctx.assets.min_format = 55
    ctx.assets.max_format = 75
