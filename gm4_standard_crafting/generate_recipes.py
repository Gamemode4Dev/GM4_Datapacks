from beet import Context, Recipe, Advancement, LootTable, Function
from beet.contrib.vanilla import Vanilla
from gm4_guidebook.generate_guidebooks import CustomCrafterRecipe
import logging

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    """generates recipes for stair and slab decrafting
        NOTE: Function definitions for custom crafters is explicitly set to a 2x2"""
    
    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.4'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
    recipes = vanilla.mount("data/minecraft/recipe").data.recipes

    def recursive_apply(items: list[str], dir: str, shape: list[str], output_count: int, function_map: list[dict[str,bool|str]]):
        for item in items:
            if "#" in item:
                recursive_apply(item_tags[item.lstrip("#")].data["values"], dir, shape, output_count, function_map)
                continue

            # get full block id from the vanilla stair recipe
            recipe = recipes.get(item)
            if not recipe:
                logger.debug(f"No vanilla recipe found for {item}, skipping")
                continue
            input = recipe.data["key"]["#"]
            if isinstance(input, list):
                output: str = input[0] # type: ignore
            else:
                output: str = input

            recipe_path = f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}"

            since_61 = "pale_oak" in item or "resin" in item
            output_pack = ctx.data.overlays["since_61"] if since_61 else ctx.data

            output_recipe = recipes.get(output) # type: ignore
            if output_recipe is None:
                group: str = output.removeprefix('minecraft:') # type: ignore
            elif "group" in output_recipe.data:
                group: str = output_recipe.data["group"]
            else:
                group: str = output.removeprefix('minecraft:') # type: ignore
                output_recipe.data["group"] = group
                output_recipe.data["__smithed__"] = {
                    "rules": [
                        {
                            "type": "replace",
                            "target": "group",
                            "source": {
                                "type": "reference",
                                "path": "group"
                            }
                        }
                    ]
                }
                output_pack[output] = Recipe(output_recipe.data)

            output_pack[recipe_path] = Recipe({
                "type": "minecraft:crafting_shaped",
                "category": "building",
                "group": group, #type: ignore
                "pattern": shape,
                "key": {
                    "#": item
                },
                "result": {
                    "id": output,
                    "count": output_count
                }
            })

            output_pack[f"gm4_standard_crafting:recipes/{dir}/{item.removeprefix('minecraft:')}"] = Advancement({
                "parent": "minecraft:recipes/root",
                "criteria": {
                    "has_the_recipe": {
                    "trigger": "minecraft:recipe_unlocked",
                        "conditions": {
                            "recipe": recipe_path
                        }
                    },
                    "has_materials": {
                    "trigger": "minecraft:inventory_changed",
                    "conditions": {
                        "items": [
                            {
                                "items": [
                                    item
                                ]
                            }
                        ]
                    }
                    }
                },
                "requirements": [
                    [
                        "has_the_recipe",
                        "has_materials"
                    ]
                ],
                "rewards": {
                    "recipes": [
                        recipe_path
                    ]
                }
            })

            ctx.data[recipe_path] = CustomCrafterRecipe({
                "name": f"gm4_standard_crafting:{dir}/{item}",
                "input": {
                    "type": "shaped",
                    "recipe": shape,
                    "key": {
                        "#": {
                            "item": item
                        }
                    }
                },
                "output": {
                    "result": {
                        "type": "item",
                        "name": output,
                        "count": output_count
                    }
                }
            })

            output_pack[f"gm4_standard_crafting:crafting/{dir}/{output.removeprefix('minecraft:')}"] = LootTable({ # type: ignore
                "type": "minecraft:generic",
                "pools": [
                    {
                        "rolls": 8,
                        "entries": [
                            {
                                "type": "minecraft:loot_table",
                                "value": "gm4:air"
                            }
                        ]
                    },
                    {
                        "rolls": 1,
                        "entries": [
                            {
                                "type": "minecraft:item",
                                "name": output,
                                "functions": [
                                    {
                                        "function": "minecraft:set_count",
                                        "count": output_count
                                    }
                                ]
                            }
                        ]
                    }
                ]
            })

            command: str = "execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if data storage gm4_custom_crafters:temp/crafter {Items:["
            slot = 0
            while slot <= 4:
                command += "{Slot:" + str(slot) + "b,id:\"" + item + "\"}"
                if slot == 4:
                    break
                command += ","
                if slot == 1:
                    slot += 1
                slot += 1
            command += "]} run loot replace block ~ ~ ~ container.0 loot" + f" gm4_standard_crafting:crafting/{dir}/{output.removeprefix('minecraft:')}" # type: ignore
            function_map.append({"command":command, "since_61":since_61})

    def create_function(function_map:list[dict[str,bool|str]], filename: str):
        function_cmds: list[str] = []
        since_61_function_cmds: list[str] = []
        for command in function_map:
            since_61_function_cmds.append(command["command"]) # type: ignore
            if command["since_61"]:
                continue
            function_cmds.append(command["command"]) # type: ignore

        ctx.data[f"gm4_standard_crafting:{filename}"] = Function(function_cmds)
        ctx.data.overlays["since_61"][f"gm4_standard_crafting:{filename}"] = Function(since_61_function_cmds)
    
    stairs_recipes_func_map: list[dict[str,bool|str]] = [{"command":"##stairs","since_61":False}]
    stairs: list[str] = item_tags["minecraft:stairs"].data['values']
    recursive_apply(stairs, "stairs_decraft", ["##", "##"], 4, stairs_recipes_func_map)
    create_function(stairs_recipes_func_map, "stairs_recipes")

    slabs_recipes_func_map: list[dict[str,bool|str]] = [{"command":"##slabs","since_61":False}]
    slabs: list[str] = item_tags["minecraft:slabs"].data['values']
    recursive_apply(slabs, "slab_decraft", ["##","##"], 2, slabs_recipes_func_map)
    create_function(slabs_recipes_func_map, "slabs_recipes")
