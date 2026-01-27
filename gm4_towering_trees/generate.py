from pathlib import Path
from typing import Any
from gm4.utils import CSV # type: ignore
import json

from beet import Context, subproject # type: ignore

def read_json(path: Path) -> CSV:
    """
    Reads in a json file and returns a python object representing the json.
    """
    with open(path, mode='r') as file:
        json_file = json.load(file)
        return json_file

def beet_default(ctx: Context):

    # read raw data
    tree_data: CSV = CSV.from_file(Path('gm4_towering_trees', 'tree_data.csv'))
    
    generate_tree_files(ctx, tree_data)

def generate_tree_files(ctx: Context, tree_data: CSV):
    """
    Generates tree placement functions based on parameters.
    """

    variant_randomizer: dict[str,Any] = {}

    for tree in tree_data:

        size_x: int = tree['size_x'].as_integer()
        size_y: int = tree['size_y'].as_integer()
        size_z: int = tree['size_z'].as_integer()
        base_x_offset: int = tree['base_x_offset'].as_integer() * -1
        base_z_offset: int = tree['base_z_offset'].as_integer() * -1
        branch_height: int = tree['branch_start_height'].as_integer() - 1
        is_mega: int = tree["is_mega"].as_integer()

        tree_type = tree['type']
        type_variant = tree['variant']

        variant_entry = variant_randomizer.setdefault(
            tree_type,
            {"count": 0, "variants": [], "ground_replacement": "execute if score $tree_placed gm4_towering_trees_data matches 1 run fill ~ ~-1 ~ ~1 ~-1 ~1 dirt replace grass_block"}
        )
        variant_entry["count"] += 1
        variant_entry["variants"].append(type_variant)
        if tree_type == "mangrove":
            variant_entry["ground_replacement"] = "# mangrove trees do not replace the ground since they are placed in the air"
        if is_mega == 0:
            variant_entry["ground_replacement"] = "execute if score $tree_placed gm4_towering_trees_data matches 1 run fill ~ ~-1 ~ ~ ~-1 ~ dirt replace grass_block"

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_towering_trees/function/generate_tree_type/{tree['type']}/{tree['variant']}.mcfunction": "templates/place_tree.mcfunction",
                    }
                ],
                "render": {
                    "functions": "*"
                }
            },
            "meta": {
                "type": tree_type,
                "variant": type_variant,
                "branch_height": branch_height,
                "is_mega": is_mega,
                "check_1_height": size_y - 1,
                "check_1_count": size_y * (is_mega + 1)**2,
                "check_2_x": size_x - 1,
                "check_2_height": size_y - branch_height - 1,
                "check_2_z": size_z - 1,
                "check_2_count": size_x * (size_y - branch_height) * size_z,
                "feature": tree['feature'],
                "x_offset": base_x_offset,
                "z_offset": base_z_offset,
                "x_offset_180": base_x_offset * -1 + is_mega,
                "z_offset_180": base_z_offset * -1 + is_mega,
                "x_offset_c90": base_z_offset * -1 + is_mega,
                "z_offset_c90": base_x_offset,
                "x_offset_cc90": base_z_offset,
                "z_offset_cc90": base_x_offset * -1 + is_mega
            }
        }
        ctx.require(subproject(subproject_config))


    for type, data in variant_randomizer.items():

        functions: str = ""
        index = 0
        for variant in data["variants"]:
            index += 1
            functions += f"execute if score $tree_variant gm4_towering_trees_data matches {index} run function gm4_towering_trees:generate_tree_type/{type}/{variant}\n"

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_towering_trees/function/generate_tree_type/{type}/pick_variant.mcfunction": "templates/pick_variant.mcfunction",
                    }
                ],
                "render": {
                    "functions": "*"
                }
            },
            "meta": {
                "variant_count": data["count"],
                "functions": functions,
                "ground_replacement": data["ground_replacement"]
            }
        }
        ctx.require(subproject(subproject_config))
