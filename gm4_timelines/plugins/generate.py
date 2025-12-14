from beet import Context
from timelines import Timeline
from beet.contrib.vanilla import Vanilla
import os
from typing import Any

TICK_FACTOR = 30
TICK_OFFSET = 6000
VERSION = os.getenv("VERSION", "1.21.11")

OUTPUT_PATH = "gm4_timelines/data/minecraft/timeline/"


def beet_default(ctx: Context):

    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = VERSION
    timelines = vanilla.mount("data/minecraft/loot_table").data[Timeline]

    for key, timeline in timelines:
        factor_ticks(ctx, key, timeline)


def factor_ticks(ctx: Context, name: Any, data: Any):
    
    tick_factor = TICK_FACTOR
    tick_offset = TICK_OFFSET
    period = data["period_ticks"]

    data["period_ticks"] = data["period_ticks"] * tick_factor

    tracks = data.get("tracks", {})
    for track in tracks.values():
        for kf in track.get("keyframes", []):
            if "ticks" in kf:
                kf["ticks"] = ((kf["ticks"] + tick_offset) % period) * tick_factor

    ctx.data[f"minecraft:{name}"] = Timeline(data)
