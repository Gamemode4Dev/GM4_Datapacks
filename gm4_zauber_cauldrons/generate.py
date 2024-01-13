from typing import List, Dict, Any
from pathlib import Path
from itertools import product
import csv
import json

from beet import Context, subproject


class CSVCell(str):
    """
    String wrapper which supports color encoding translation.
    """

    DEC = 'dec'  # for numbers formatted 16777215
    HEX = 'hex'  # for numbers formatted #AB0EFF
    FLOAT = 'float'  # for numbers formatted [0.5, 0.2, 0.9]

    def as_integer(self) -> int:
        """
        Interprets the string contained in this CSVCell as an integer.
        Tries to detect the base automatically.
        """
        if self.startswith('#') and len(self) == 7:  # alternative way of marking base 16 (hex colors)
            return CSVCell('0x' + self.lstrip('#')).as_integer()
        if self.startswith('0x'):  # check if the string is in base 2
            return int(self, 16)
        if self.startswith('0o'):  # check if the string is in base 8
            return int(self, 8)
        if self.startswith('0b'):  # check if the string is in base 16
            return int(self, 2)
        return int(self)  # string must be base 10

    def to_color_code(self, encoding: str) -> 'CSVCell':
        """
        Outputs the string contained in this CSVCell formatted as a color code, e.g. #4AA0C7 if 'HEX' is given.
        """
        if encoding == CSVCell.HEX:
            return CSVCell('#' + hex(self.as_integer()).lstrip('0x'))
        if encoding == CSVCell.DEC:
            return CSVCell(self.as_integer())
        if encoding == CSVCell.FLOAT:
            dec = self.as_integer()
            return CSVCell([(dec >> 16) / 255, ((dec >> 8) & 0xFF) / 255, (dec & 0xFF) / 255])
        raise ValueError(
            f"Invalid encoding '{encoding}'. Must be '{CSVCell.DEC}', '{CSVCell.HEX}', or '{CSVCell.FLOAT}'.")


class CSVRow():
    """
    Read-only dict wrapper which represents a row of data from a .csv file.
    """

    def __init__(self, column_names: List[str] | None = None, data: List[CSVCell] | None = None) -> None:
        """
        Initialize a new CSVRow object using the supplied column names and data. CSVRow objects are read-only by design.
        If no data and no column names are supplied the resulting CSVRow object will evaluate to false in boolean expressions.

        Access data within this CSVRow via the `get(key, default)` method or using `[<key: str>]`.
        """
        if not column_names:
            column_names = []
        if not data:
            data = []

        if len(column_names) != len(data):
            raise ValueError(
                f"Could not build CSVRow from supplied column names and data; Number of supplied column names ({len(column_names)}) does not match number of supplied data entries ({len(data)}).")

        self._data = {column_names[column_index]: value for column_index, value in enumerate(data)}

    def __bool__(self):
        """
        Allow for the use of CSVRow instances in if statements; If the CSVRow has no keys it is equivalent to `False`.
        """
        return len(self._data.keys()) != 0

    def __getitem__(self, key: str):
        try:
            return self._data[key]
        except KeyError as ke:
            raise ValueError(
                f"Failed to select column named '{ke.args[0]}' from CSVRow with columns {[key for key in self._data]}.")

    def __repr__(self) -> str:
        return str(self._data)

    def get(self, key: str, default: str | Any) -> CSVCell:
        """
        Returns the value corrosponding to the key if it exists and is not the empty string.
        Else returns the provided default. The provided default is cast to a string internally.
        """
        value = self._data.get(key, CSVCell(default))
        if value:
            return value
        else:
            return CSVCell(default)


class CSV():
    """
    List-of-Rows representation of a .csv file which can be iteraded over using for ... in.
    Optimized for row-first access, i.e. select a row, then a column.
    Also provides a `find_row` function for column-first, i.e. select a column, then a row, access.
    However, the latter is is more expensive.

    All access methods return CSVRow objects which are dynamically created upon calling an access method.
    """

    def __init__(self, column_names: List[str], rows: List[List[CSVCell]]) -> None:
        """
        Initialize a new CSV from a list of column names (headers) and a list of rows.
        The latter contain actual data, whilst the former only holds names of columns.
        """
        self._column_names = column_names
        self._rows = rows

    def __iter__(self):
        self.__current = 0
        self.__last = len(self._rows)
        return self

    def __next__(self) -> CSVRow:
        current = self.__current
        self.__current += 1
        if current < self.__last:
            return CSVRow(self._column_names, self._rows[current])
        raise StopIteration()

    def __getitem__(self, row_index: int):
        return CSVRow(self._column_names, self._rows[row_index])

    def __repr__(self):
        return str([CSVRow(self._column_names, data) for data in self._rows])

    def find_row(self, value: str, by_column: str | int = 0) -> CSVRow:
        """
        Finds and returns the first row in this CSV which has `value` in column `by_column`. `by_column` can either be a str, in which case it is treated
        as a column name and the header line is searched for a matching string, or an int n, in which case the nth column is selected.
        `by_column` defaults to `0`.
        Returns an empty `CSVRow` if no match was found.
        """
        if isinstance(by_column, str):
            by_column = self._column_names.index(by_column)

        for row in self._rows:
            if row[by_column] == value:
                return CSVRow(self._column_names, row)
        return CSVRow()


def read_csv(path: Path) -> CSV:
    """
    Reads in a csv file and returns a list of rows. Each row consists of a dictionary which contains labeled values.
    """
    with open(path, mode='r') as file:
        csv_file = csv.reader(file)
        header = next(csv_file)

        return CSV(column_names=header, rows=[[CSVCell(cell) for cell in row] for row in csv_file])


def read_json(path: Path) -> Any:
    """
    Reads in a json file and returns a python object representing the json.
    """
    with open(path, mode='r') as file:
        json_file = json.load(file)
        return json_file


def beet_default(ctx: Context):

    # read raw data
    armor_flavors: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_flavors.csv'))
    armor_pieces: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'armor_pieces.csv'))
    crystal_effects: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_effects.csv'))
    crystal_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'crystal_lores.json'))
    flower_types: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'flower_types.csv'))
    magicol_colors: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'magicol_colors.csv'))
    potion_bottles: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_bottles.csv'))
    potion_effects: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_effects.csv'))
    potion_bottles: CSV = read_csv(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_bottles.csv'))
    potion_lores: Any = read_json(
        Path('gm4_zauber_cauldrons', 'raw', 'potion_lores.json'))
    weather_modifiers: CSV = read_csv(
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


def generate_crystal_recipes(ctx: Context, crystal_effects: CSV, crystal_lores: Dict[str, Any], potion_effects: CSV):
    """
    Generates the function tree and loot tables for zauber crystals.
    """
    for effect_data in crystal_effects:

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/functions/recipes/crystals/effects/{effect_data['effect']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/crystals/craft_crystal.mcfunction",
                        f"data/gm4_zauber_cauldrons/loot_tables/items/crystals/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/zauber_crystal.json",
                        f"data/gm4_zauber_cauldrons/loot_tables/technical/replace_offhand_crystal/{effect_data['effect']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/replace_offhand_crystal.json"
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
    for bottle_data, effect_data in product(potion_bottles, potion_effects):

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
                "custom_potion_color": effect_data['custom_potion_color'].to_color_code(CSVCell.DEC),
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


def generate_magicol_recipes(ctx: Context, weather_modifiers: CSV, magicol_colors: CSV, potion_bottles: CSV):
    """
    Generates the function tree for crafting th magicol liquid.
    """
    for bottle_data, color_data, modifier_data in product(potion_bottles, magicol_colors, weather_modifiers):

        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_zauber_cauldrons/functions/recipes/magicol/{color_data['color']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/craft_liquid_magicol.mcfunction",
                        f"data/gm4_zauber_cauldrons/functions/recipes/magicol/bottled/{bottle_data['bottle']}/select_color.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/select_color.mcfunction",
                        f"data/gm4_zauber_cauldrons/functions/recipes/magicol/bottled/{bottle_data['bottle']}/{color_data['color']}/select_weather_modifier.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/select_weather_modifier.mcfunction",
                        f"data/gm4_zauber_cauldrons/functions/recipes/magicol/bottled/{bottle_data['bottle']}/{color_data['color']}/{modifier_data['modifier']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/magicol/craft_bottled_magicol.mcfunction",
                        f"data/gm4_zauber_cauldrons/loot_tables/items/bottled_magicol/{bottle_data['bottle']}/{color_data['color']}/{modifier_data['modifier']}.json": "data/gm4_zauber_cauldrons/templates/loot_tables/bottled_magicol.json"
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
                "liquid_custom_model_data": color_data['liquid_custom_model_data'],
                "bottle_custom_model_data": modifier_data['bottle_custom_model_data'],
                "soulution_bottle_custom_model_data": modifier_data['soulution_bottle_custom_model_data'],
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
                        f"data/gm4_zauber_cauldrons/functions/bottled_magicol/{color_data['color']}/select_weather_modifier.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/bottled_magicol/select_weather_modifier.mcfunction",
                        f"data/gm4_zauber_cauldrons/functions/bottled_magicol/{color_data['color']}/{modifier_data['modifier']}.mcfunction": "data/gm4_zauber_cauldrons/templates/functions/bottled_magicol/color_biome.mcfunction",
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
