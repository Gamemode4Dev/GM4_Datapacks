# beet plugin to add the liquid_wrappers.bolt module to other gm4 datapacks more easily
from beet import Context
from bolt import Module
from pathlib import Path


def beet_default(ctx: Context):
    ctx.data[Module]['gm4_liquid_tanks:liquid_wrappers'] = Module(source_path=Path("gm4_liquid_tanks/data/gm4_liquid_tanks/modules/liquid_wrappers.bolt"))
