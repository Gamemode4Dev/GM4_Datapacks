from beet import Context

# Due to a bug in beet, we need to manually set the overlay formats
def beet_default(ctx: Context):
  del ctx.data.overlays["backport_64"]
