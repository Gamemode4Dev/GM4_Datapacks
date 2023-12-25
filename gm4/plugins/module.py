from beet import Context, PngFile, Advancement, TextFile
from pathlib import Path
from typing import ClassVar, Tuple

def default_pack_icon(ctx: Context):
    """Adds the default pack.png from base to the build, if one does not already exist"""
    if "pack.png" not in ctx.data.extra:
        ctx.data.extra["pack.png"] = PngFile(source_path=Path("base/pack.png"))

def gm4_root_advancement(ctx: Context):
    """Adds the root display advancement gm4:root, if the module has any display advancements"""
    if len(ctx.data["gm4"].advancements.keys()) > 0:
        ctx.data.advancements["gm4:root"] = Advancement(
            {
                "display": {
                    "icon": {
                        "item": "command_block",
                        "nbt": "{CustomModelData:3420001}"
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


def tests(ctx: Context):
    ctx.data.extend_namespace += [TestFile]


class TestFile(TextFile):
    """Class representing an test function."""

    scope: ClassVar[Tuple[str, ...]] = ("tests",)
    extension: ClassVar[str] = ".mcfunction"
