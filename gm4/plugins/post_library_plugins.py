from beet import Context
from gm4.plugins.versioning import cache_premodule_advancements

def beet_default(ctx: Context):
    """A collection of plugins for modules to run after including files from libraries, before including the module's files"""
    ctx.require(cache_premodule_advancements)