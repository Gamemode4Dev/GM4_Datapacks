from beet import Context, PngFile, Advancement
from pathlib import Path

def default_pack_icon(ctx: Context):
    """Adds the default pack.png from base to the build, if one does not already exist"""
    if "pack.png" not in ctx.data.extra:
        ctx.data.extra["pack.png"] = PngFile(source_path=Path("base/pack.png"))

def gm4_root_advancement(ctx: Context):
    """Adds the root display advancement gm4:root, if the module has any display advancements"""
    if len(ctx.data["gm4"].advancement.keys()) > 0:
        ctx.data.advancement["gm4:root"] = Advancement(
            {
                "display": {
                    "icon": {
                        "id": "command_block",
                        "components": {
                            "minecraft:custom_model_data": 3420001
                        }
                    },
                    "title": {
                        "translate": "advancement.gm4.root.title",
                        "fallback": "Gamemode 4"
                    },
                    "description": {
                        "translate": "advancement.gm4.root.description",
                        "fallback": "Semi-funny blurb about GM4",
                        "color": "gray"
                    },
                    "background": "textures/block/light_blue_concrete_powder.png",
                    "announce_to_chat": False
                },
                "criteria": {
                    "automatic": {
                        "trigger": "minecraft:tick"
                    }
                }
            }
        )
