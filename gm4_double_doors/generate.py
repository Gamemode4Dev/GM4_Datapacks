from typing import ClassVar

from beet import Context, Structure, TextFile, subproject
from beet.contrib.vanilla import Vanilla
from nbtlib import parse_nbt


class StringStructure(TextFile):
    """Create class that loads .snbt files into the beet project"""
    scope: ClassVar[tuple[str, ...]] = ("structures",)
    extension: ClassVar[str] = ".snbt"

    def serialize_to_structure(self) -> Structure:
        return Structure(parse_nbt(self.text))

def register_snbt_files(ctx: Context):
    # register the custom file-type with beet so those files are mounted
    ctx.data.extend_namespace.append(StringStructure)


def beet_default(ctx: Context):
    vanilla = ctx.inject(Vanilla)
    wooden_doors = vanilla.data.block_tags["minecraft:wooden_doors"]
    
    # for each wood type in the vanilla doors tag, render a copy of the "templates" directory with the appropiate wood-type
    for wood_type in [s.removeprefix("minecraft:").removesuffix("_door") for s in wooden_doors.data["values"]]:
        subproject_config = {
            "require": [
                "gm4_double_doors.generate.register_snbt_files"
            ],
            "data_pack":{
                "load": [
                    {
                        f"data/gm4_double_doors/advancements/{wood_type}": "data/gm4_double_doors/templates/advancements",
                        f"data/gm4_double_doors/functions/{wood_type}": "data/gm4_double_doors/templates/functions",
                        f"data/gm4_double_doors/structures/{wood_type}": "data/gm4_double_doors/templates/structures",
                    }
                ],
                "render":{
                    "advancements": "*",
                    "functions": "*",
                    "string_structures": "*" # renders all mounted files of the StringStructure container
                }
            },
            "meta":{
                "material_name": wood_type
            }
        }

        ctx.require(subproject(subproject_config))

    # transform the "string-structure" files into actual binary files
    for name, struct in ctx.data[StringStructure].items():
        ctx.data[Structure][name] = struct.serialize_to_structure()
    ctx.data[StringStructure].clear()
