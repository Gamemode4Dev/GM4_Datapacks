from typing import List, Dict, Any
from pathlib import Path
import csv
import json

from beet import Context, subproject


def read_csv(path: Path) -> List[Dict[str, str]]:
    """
    Reads in a csv file and returns a list of rows. Each row consists of a dictionary which contains labeled values.
    """
    with open(path, mode='r') as file:
        csv_file = csv.reader(file)
        header = next(csv_file)

        return [{header[column_index]: value for column_index, value in enumerate(row)} for row in csv_file]


def read_json(path: Path) -> Any:
    """
    Reads in a json file and returns a python object representing the json.
    """
    with open(path, mode='r') as file:
        json_file = json.load(file)
        return json_file


def beet_default(ctx: Context):
    generate_armor_recipes(ctx)
    generate_crystal_recipes(ctx)
    generate_potion_recipes(ctx)


def generate_armor_recipes(ctx: Context):
    """
    Generates the function tree and loot tables for all combinations of zauber armor.
    """
    armor_flavors: List[Dict[str, str]] = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_flavors.csv'))
    armor_pieces: List[Dict[str, str]] = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_pieces.csv'))

    # create a loot tables and functions for each zauber armor piece + flavor combination
    for flavor_data in armor_flavors:
        for piece_data in armor_pieces:

            subproject_config = {
                "data_pack": {
                    "load": [
                        {
                            f"data/gm4_zauber_cauldrons/functions/recipes/armor/{piece_data['piece']}/select_flavor.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/armor/select_flavor.mcfunction",
                            f"data/gm4_zauber_cauldrons/functions/recipes/armor/{piece_data['piece']}/{flavor_data['flavor']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/armor/craft_piece.mcfunction",
                            f"data/gm4_zauber_cauldrons/loot_tables/items/armor/{piece_data['piece']}/{flavor_data['flavor']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_armor.json"
                        }
                    ],
                    "render": {
                        "functions": "*",
                        "loot_tables": "*"
                    }
                },
                "meta": {
                    "armor_value": piece_data['armor'],
                    "custom_model_data": flavor_data['custom_model_data'],
                    "flavor": flavor_data['flavor'],
                    "flavor_amount": flavor_data['amount'],
                    "flavor_attribute": flavor_data['attribute'],
                    "flavor_operation": flavor_data['operation'],
                    "piece": piece_data['piece'],
                    "slot": piece_data['slot'],
                    "translate_fallback": piece_data['translate_fallback']
                }
            }

            ctx.require(subproject(subproject_config))


def generate_crystal_recipes(ctx: Context):
    """
    Generates the function tree and loot tables for zauber crystals.
    """
    crystal_effects: List[Dict[str, str]] = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_effects.csv'))
    crystal_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_lores.json'))

    for effect_data in crystal_effects:

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/functions/recipes/crystals/effects/{effect_data['effect']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/crystals/craft_crystal.mcfunction",
                        f"data/gm4_zauber_cauldrons/loot_tables/items/crystals/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_crystal.json"
                    }
                ],
                "render": {
                    "functions": "*",
                    "loot_tables": "*"
                }
            },
            "meta": {
                "effect": effect_data['effect'],
                "custom_model_data": effect_data['custom_model_data'],
                "texture_version": effect_data['texture_version'],
                "translate_fallback": effect_data['translate_fallback'],
                "lore": json.dumps(crystal_lores[effect_data['effect']])
            }
        }
        ctx.require(subproject(subproject_config))


def generate_potion_recipes(ctx: Context):
    """
    Generates the function tree and loot tables for zauber potions and soulutions.
    """
    potion_effects: List[Dict[str, str]] = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_effects.csv'))
    potion_bottles: List[Dict[str, str]] = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_bottles.csv'))
    potion_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_lores.json'))

    for bottle_data in potion_bottles:
        for effect_data in potion_effects:

            subproject_config = {
                "data_pack": {
                    "load": [
                        {
                            f"data/gm4_zauber_cauldrons/functions/recipes/potions/{bottle_data['bottle']}/select_effect.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/potions/select_effect.mcfunction",
                            f"data/gm4_zauber_cauldrons/functions/recipes/potions/{bottle_data['bottle']}/{effect_data['effect']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/potions/craft_potion.mcfunction",
                            f"data/gm4_zauber_cauldrons/loot_tables/items/potions/{bottle_data['bottle']}/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_potion.json"
                        }
                    ],
                    "render": {
                        "functions": "*",
                        "loot_tables": "*"
                    }
                },
                "meta": {
                    "effect": effect_data['effect'],
                    "effect_translate_name": effect_data['effect_translate_name'],
                    "custom_potion_color": effect_data['custom_potion_color'],
                    "custom_potion_effects": effect_data['custom_potion_effects'],
                    "bottle_item_id": bottle_data['item_id'],
                    "bottle": bottle_data['bottle'],
                    "soulution_custom_model_data": effect_data['soulution_custom_model_data'],
                    "soulution_translate_fallback": effect_data['soulution_translate_fallback'],
                    "sips_translate_name": bottle_data['sips_translate_name'],
                    "sips_translate_fallback": bottle_data['sips_translate_fallback'],
                    "lore": json.dumps(potion_lores[effect_data['effect']])

                }
            }
            ctx.require(subproject(subproject_config))
