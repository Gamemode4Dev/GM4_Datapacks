from typing import ClassVar
from pathlib import Path
import csv
from dataclasses import dataclass
import logging

from beet import Context, Structure, TextFile, subproject
from beet.contrib.vanilla import Vanilla
from nbtlib import parse_nbt
from gm4.plugins.manifest import repro_structure_to_bytes

logger = logging.getLogger(__name__)

class StringStructure(TextFile):
    """Create class that loads .snbt files into the beet project"""
    scope: ClassVar[tuple[str, ...]] = ("structure",)
    extension: ClassVar[str] = ".snbt"

    def serialize_to_structure(self) -> Structure:
        return Structure(parse_nbt(self.text), serializer=repro_structure_to_bytes)


def register_snbt_files(ctx: Context):
    # register the custom file-type with beet so those files are mounted
    ctx.data.extend_namespace.append(StringStructure)


def read_sound_id_from_csv():
    with open(Path('gm4_double_doors', 'raw', 'sound_names.csv'), mode='r') as file:
        csv_file = csv.reader(file)
        next(csv_file)  # skip header line
        return {row[0]: DoorSound(open=row[1],close=row[2]) for row in csv_file}

@dataclass
class DoorSound():
    open: str
    close: str


def beet_default(ctx: Context):
    vanilla = ctx.inject(Vanilla)
    wood_types = [s.removeprefix("minecraft:").removesuffix(
        "_door") for s in vanilla.data.block_tags["minecraft:wooden_doors"].data["values"]]
    # make list of wood types accessible for bolt
    ctx.meta['wood_types'] = wood_types

    # store door opening/closing sounds to dict
    sound_ids = read_sound_id_from_csv()
    for wood in wood_types:
        if not wood in sound_ids: # if sound is not specified in csv, default to normal wooden door sound
            logger.info(f"{wood} door has no sound configured sound effect. Using the default instead")
            sound_ids[wood] = DoorSound(open='minecraft:block.wooden_door.open', close='minecraft:block.wooden_door.close')
    ctx.meta['sound_ids'] = sound_ids  # make sound dict accessible to bolt

    # for each wood type in the vanilla doors tag, render a copy of the "templates" directory with the appropiate wood-type
    for wood in wood_types:
        subproject_config = {
            "require": [
                "gm4_double_doors.generate.register_snbt_files"
            ],
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_double_doors/advancement/{wood}": "data/gm4_double_doors/templates/advancement",
                        f"data/gm4_double_doors/function/{wood}": "data/gm4_double_doors/templates/function",
                        f"data/gm4_double_doors/structure/{wood}": "data/gm4_double_doors/templates/structure",
                    }
                ],
                "render": {
                    "advancement": "*",
                    "function": "*",
                    "string_structure": "*"  # renders all mounted files of the StringStructure container
                }
            },
            "meta": {
                "material_name": wood
            }
        }

        ctx.require(subproject(subproject_config))

    # transform the "string-structure" files into actual binary files
    for name, struct in ctx.data[StringStructure].items():
        ctx.data[Structure][name] = struct.serialize_to_structure()
    ctx.data[StringStructure].clear()
