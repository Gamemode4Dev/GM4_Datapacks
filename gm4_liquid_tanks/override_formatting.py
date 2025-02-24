from beet import Context
from mecha import Mecha

def beet_default(ctx: Context):
    ctx.inject(Mecha).serialize.formatting.layout = 'dense'