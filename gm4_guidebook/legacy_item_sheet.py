from beet import Context

def beet_default(ctx: Context):
    """Merges the `guidebook_items.json Font with the master `guidebook.json`.
    This is the temporary-ish organization technique until our custom models/items can be rendered on demand and formed into a spritesheet"""

    ctx.assets.fonts["gm4:guidebook"].merge( ctx.assets.fonts["gm4:guidebook_items"] )
