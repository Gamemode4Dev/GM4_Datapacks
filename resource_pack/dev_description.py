from beet import Context

def beet_default(ctx: Context):
    ctx.assets.description = [
			"Merged Developer Resources\n",
			{
				"text": f"Development Only!",
				"color": "red"
			}
		]
