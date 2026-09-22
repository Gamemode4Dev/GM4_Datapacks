from beet import Context

def beet_default(ctx: Context):
    ctx.assets.description = [
			"Merged Developer Resources\n",
			{
				"text": f"Development Only!",
				"color": "red"
			}
		]
    ctx.assets.min_format = 97
    ctx.assets.max_format = 97
