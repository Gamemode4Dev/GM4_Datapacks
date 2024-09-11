from typing import Dict, Any
from pathlib import Path
from itertools import product
from gm4.utils import CSV, CSVCell
import json
import nbtlib # type: ignore

from beet import Context, Model, subproject

def read_json(path: Path) -> Any:
    """
    Reads in a json file and returns a python object representing the json.
    """
    with open(path, mode='r') as file:
        json_file = json.load(file)
        return json_file

def beet_default(ctx: Context):

    # read raw data
    armor_flavors: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_flavors.csv'))
    armor_pieces: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_pieces.csv'))
    crystal_effects: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_effects.csv'))
    crystal_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_lores.json'))
    flower_types: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'flower_types.csv'))
    magicol_colors: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'magicol_colors.csv'))
    potion_bottles: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_bottles.csv'))
    potion_effects: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_effects.csv'))
    potion_bottles: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_bottles.csv'))
    potion_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_lores.json'))
    weather_modifiers: CSV = CSV.from_file(
        Path('gm4_zauber_cauldrons', 'raw', 'weather_modifiers.csv'))

    # generate files
    generate_armor_recipes(ctx, armor_flavors, armor_pieces)
    generate_crystal_recipes(ctx, crystal_effects, crystal_lores, potion_effects)
    generate_potion_recipes(ctx, potion_effects, potion_bottles, potion_lores)
    generate_magicol_recipes(ctx, weather_modifiers,
                             magicol_colors, potion_bottles)
    generate_zauber_biomes(ctx, weather_modifiers,
                           magicol_colors, potion_bottles, flower_types)
    generate_flower_features(ctx, flower_types)

    # make some csv data available to bolt later
    ctx.meta['armor_flavors'] = armor_flavors
    ctx.meta['armor_pieces'] = armor_pieces
    ctx.meta['crystal_effects'] = crystal_effects
    ctx.meta['flower_types'] = flower_types
    ctx.meta['magicol_colors'] = magicol_colors
    ctx.meta['potion_bottles'] = potion_bottles
    ctx.meta['potion_effects'] = potion_effects
    ctx.meta['potion_bottles'] = potion_bottles
    ctx.meta['weather_modifiers'] = weather_modifiers


def generate_armor_recipes(ctx: Context, armor_flavors: CSV, armor_pieces: CSV):
    """
    Generates the function tree and loot tables for all combinations of zauber armor.
    """
    # create a loot tables and functions for each zauber armor piece + flavor combination
    for flavor_data in armor_flavors:
        armor_items: list[str] = []
        armor_models: dict[str, str] = {}
        for piece_data in armor_pieces:
            armor_items.append(item:=f"golden_{piece_data['piece']}")
            armor_models.update({item: (tex_model:=f"item/zauber_armor/{flavor_data['flavor']}/{piece_data['piece']}")})

            subproject_config = {
                "data_pack": {
                    "load": [
                        {
                            f"data/gm4_zauber_cauldrons/function/recipes/armor/{piece_data['piece']}/select_flavor.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/armor/select_flavor.mcfunction",
                            f"data/gm4_zauber_cauldrons/function/recipes/armor/{piece_data['piece']}/{flavor_data['flavor']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/armor/craft_piece.mcfunction",
                            f"data/gm4_zauber_cauldrons/loot_table/items/armor/{piece_data['piece']}/{flavor_data['flavor']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_armor.json"
                        }
                    ],
                    "render": {
                        "functions": "*",
                        "loot_tables": "*"
                    }
                },
                "meta": {
                    "armor_value": piece_data['armor'],
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

            ctx.generate(tex_model, Model({
                "parent": "minecraft:item/generated",
                "textures": {
                    "layer0": f"gm4_zauber_cauldrons:{tex_model}"
                }
            }))

        ctx.meta["gm4"].setdefault("model_data", []).append({
            "item": armor_items,
            "reference": f"item/zauber_armor/{flavor_data['flavor']}",
            "model": armor_models,
            "template": "custom",
        })


def generate_crystal_recipes(ctx: Context, crystal_effects: CSV, crystal_lores: Dict[str, Any], potion_effects: CSV):
    """
    Generates the function tree and loot tables for zauber crystals.
    """
    for effect_data in crystal_effects:

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/function/recipes/crystals/effects/{effect_data['effect']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/crystals/craft_crystal.mcfunction",
                        f"data/gm4_zauber_cauldrons/loot_table/items/crystals/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_crystal.json",
                        f"data/gm4_zauber_cauldrons/loot_table/technical/replace_offhand_crystal/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/replace_offhand_crystal.json"
                    }
                ],
                "render": {
                    "functions": "*",
                    "loot_tables": "*"
                }
            },
            "meta": {
                "effect": effect_data['effect'],
                "custom_potion_color": potion_effects.find_row(value=effect_data['effect'], by_column='effect')['custom_potion_color'].to_color_code(CSVCell.DEC),
                "translate_fallback": effect_data['translate_fallback'],
                "lore": json.dumps(crystal_lores[effect_data['effect']])
            }
        }
        ctx.require(subproject(subproject_config))


def generate_potion_recipes(ctx: Context, potion_effects: CSV, potion_bottles: CSV, potion_lores: Dict[str, Any]):
    """
    Generates the function tree and loot tables for zauber potions and soulutions.
    """
    for effect_data in potion_effects:
        for bottle_data in potion_bottles:

            subproject_config = {
                "data_pack": {
                    "load": [
                        {
                            f"data/gm4_zauber_cauldrons/function/recipes/potions/{bottle_data['bottle']}/select_effect.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/potions/select_effect.mcfunction",
                            f"data/gm4_zauber_cauldrons/function/recipes/potions/{bottle_data['bottle']}/{effect_data['effect']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/potions/craft_potion.mcfunction",
                            f"data/gm4_zauber_cauldrons/loot_table/items/potions/{bottle_data['bottle']}/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_potion.json"
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
                    "custom_potion_color": effect_data['custom_potion_color'].to_color_code(CSVCell.DEC),
                    "custom_potion_effects": json.dumps(nbtlib.parse_nbt(effect_data['custom_potion_effects']).unpack(json=True)), # type: ignore
                    "bottle_item_id": bottle_data['item_id'],
                    "bottle": bottle_data['bottle'],
                    "soulution_translate_fallback": bottle_data["soulution_translate_fallback_prefix"] + effect_data['soulution_translate_fallback'],
                    "sips_translate_name": bottle_data['sips_translate_name'],
                    "sips_translate_fallback": bottle_data['sips_translate_fallback'],
                    "lore": json.dumps(potion_lores[effect_data['effect']])
                }
            }
            ctx.require(subproject(subproject_config))

        ctx.meta["gm4"]["model_data"].append({
            "item": ["potion", "splash_potion", "lingering_potion"],
            "reference": f"item/soulution_potion/{effect_data['effect']}",
            "template": "vanilla"
        })


def generate_magicol_recipes(ctx: Context, weather_modifiers: CSV, magicol_colors: CSV, potion_bottles: CSV):
    """
    Generates the function tree for crafting th magicol liquid.
    """
    for bottle_data, color_data, modifier_data in product(potion_bottles, magicol_colors, weather_modifiers):

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/function/recipes/magicol/{color_data['color']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/craft_liquid_magicol.mcfunction",
                        f"data/gm4_zauber_cauldrons/function/recipes/magicol/bottled/{bottle_data['bottle']}/select_color.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/select_color.mcfunction",
                        f"data/gm4_zauber_cauldrons/function/recipes/magicol/bottled/{bottle_data['bottle']}/{color_data['color']}/select_weather_modifier.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/select_weather_modifier.mcfunction",
                        f"data/gm4_zauber_cauldrons/function/recipes/magicol/bottled/{bottle_data['bottle']}/{color_data['color']}/{modifier_data['modifier']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/craft_bottled_magicol.mcfunction",
                        f"data/gm4_zauber_cauldrons/loot_table/items/bottled_magicol/{bottle_data['bottle']}/{color_data['color']}/{modifier_data['modifier']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/bottled_magicol.json"
                    }
                ],
                "render": {
                    "functions": "*",
                    "loot_tables": "*"
                }
            },
            "meta": {
                "color": color_data['color'],
                "potion_color": color_data['potion_color'].to_color_code(CSVCell.DEC),
                "bottle": bottle_data['bottle'],
                "bottle_item_id": bottle_data['item_id'],
                "weather_modifier": modifier_data['modifier'],
                "sips_translate_name": bottle_data['sips_translate_name'],
                "sips_translate_fallback": bottle_data['sips_translate_fallback'],
                "translate_name": modifier_data['translate_name'],
                "translate_fallback": modifier_data['translate_fallback'],
                "color_translate_name": color_data['color_translate_name'],
                "color_translate_fallback": color_data['color_translate_fallback'],
                "soulution_translate_fallback": modifier_data['soulution_translate_fallback']
            }
        }
        ctx.require(subproject(subproject_config))

    for color_data in magicol_colors:
        ctx.meta["gm4"]["model_data"].append({
            "item": f"{color_data['color']}_concrete_powder",
            "reference": f"block/liquid_magicol/{color_data['color']}",
            "template": "vanilla"
        })


def generate_zauber_biomes(ctx: Context, weather_modifiers: CSV, magicol_colors: CSV, potion_bottles: CSV, flower_types: CSV):
    """
    Generates biome files for verzauberte plains biomes.
    """
    for bottle_data, color_data, modifier_data in product(potion_bottles, magicol_colors, weather_modifiers):

        # skip drinkable
        if bottle_data['bottle'] == 'drinkable':
            continue

        # prepare biome particle for splash & lingering
        adjective = ''
        biome_particle = ''
        if bottle_data['bottle'] == 'lingering':
            adjective = 'glittering_'
            # convert base-10 colors to rgb float colors
            biome_particle = '"particle":{"options":{"type":"minecraft:dust","color":' + color_data.get(
                f"particle_color_{modifier_data['modifier']}", 7979098).to_color_code(CSVCell.FLOAT) + ',"scale":2},"probability":0.002},'

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/function/bottled_magicol/{color_data['color']}/select_weather_modifier.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/bottled_magicol/select_weather_modifier.mcfunction",
                        f"data/gm4_zauber_cauldrons/function/bottled_magicol/{color_data['color']}/{modifier_data['modifier']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/bottled_magicol/color_biome.mcfunction",
                        f"data/gm4_zauber_cauldrons/worldgen/biome/{adjective}{modifier_data['modifier']}_{color_data['color']}_verzauberte_plains.json": "data/gm4_zauber_cauldrons/templates/worldgen/biome/verzauberte_plains.json"
                    }
                ],
                "render": {
                    "functions": "*",
                    "worldgen_biomes": "*"
                }
            },
            "meta": {
                "color": color_data['color'],
                "potion_color": color_data['potion_color'].to_color_code(CSVCell.DEC),
                "weather_modifier": modifier_data['modifier'],
                "temperature": 0.0 if modifier_data['modifier'] == 'polar' else 0.7,
                "sky_color": color_data.get(f"sky_color_{modifier_data['modifier']}", 7972607).to_color_code(CSVCell.DEC),
                "has_precipitation": 'false' if modifier_data['modifier'] == 'arid' else 'true',
                "fog_color": color_data.get(f"fog_color_{modifier_data['modifier']}", 12638463).to_color_code(CSVCell.DEC),
                "water_color": color_data.get(f"water_color_{modifier_data['modifier']}", 4159204).to_color_code(CSVCell.DEC),
                "water_fog_color": color_data.get(f"water_fog_color_{modifier_data['modifier']}", 329011).to_color_code(CSVCell.DEC),
                "grass_color": color_data.get(f"grass_color_{modifier_data['modifier']}", 7979098).to_color_code(CSVCell.DEC),
                "foliage_color": color_data.get(f"foliage_color_{modifier_data['modifier']}", 5877296).to_color_code(CSVCell.DEC),
                "biome_particle": biome_particle,
                "flower": flower_types.find_row(color_data['flower'], 'flower').get('flower', 'short_grass') # only add flowers which are registered as zauber flowers
            }
        }
        ctx.require(subproject(subproject_config))


def generate_flower_features(ctx: Context, flower_types: CSV):
    """
    Generates the worldgen features required for spawning lucky flowers with composter particles upon the use of magicol to convert a biome.
    """
    for flower_data in flower_types:

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/worldgen/configured_feature/{flower_data['flower']}_patch.json": "data/gm4_zauber_cauldrons/templates/worldgen/configured_feature/flower_patch.json",
                        f"data/gm4_zauber_cauldrons/worldgen/placed_feature/{flower_data['flower']}_patch.json": "data/gm4_zauber_cauldrons/templates/worldgen/placed_feature/flower_patch.json"
                    }
                ],
                "render": {
                    "worldgen_configured_features": "*",
                    "worldgen_placed_features": "*"
                }
            },
            "meta": {
                "flower": flower_data['flower']
            }
        }
        ctx.require(subproject(subproject_config))
