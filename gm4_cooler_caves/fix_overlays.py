from beet import Context

# Due to a bug in beet, we need to manually set the overlay formats
def beet_default(ctx: Context):
  overlay = ctx.data.overlays["backport_88"]
  overlay.min_format = 1
  overlay.max_format = 88
  overlay.supported_formats = {"min_inclusive": 1, "max_inclusive": 88}
