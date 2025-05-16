from beet import Context, Recipe, Advancement, LootTable, Function
from beet.contrib.vanilla import Vanilla
from gm4_guidebook.generate_guidebooks import CustomCrafterRecipe
import logging

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    """generates recipes for stair and slab decrafting
        NOTE: Function definitions for custom crafters is explicitly set to a 2x2"""
    
    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.5'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
    recipes = vanilla.mount("data/minecraft/recipe").data.recipes

    def recursive_apply(items: list[str], dir: str, shape: list[str], output_count: int, function: Function):
        for item in items:
            if "#" in item:
                recursive_apply(item_tags[item.lstrip("#")].data["values"], dir, shape, output_count, function)
                continue

            # get full block id from the vanilla stair recipe
            recipe = recipes.get(item)
            if not recipe:
                logger.debug(f"No vanilla recipe found for {item}, skipping")
                continue
            input: str | list[str] = recipe.data["key"]["#"]
            if isinstance(input, list):
                output = input[0]
            else:
                output = input

            recipe_path = f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}"

            output_recipe = recipes.get(output)
            if output_recipe is None:
                group: str = output.removeprefix('minecraft:')
            elif "group" in output_recipe.data:
                group: str = output_recipe.data["group"]
            else:
                group: str = output.removeprefix('minecraft:')
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
                ctx.data[output] = Recipe(output_recipe.data)

            ctx.data[recipe_path] = Recipe({
                "type": "minecraft:crafting_shaped",
                "category": "building",
                "group": group,
                "pattern": shape,
                "key": {
                    "#": item
                },
                "result": {
                    "id": output,
                    "count": output_count
                }
            })

            ctx.data[f"gm4_standard_crafting:recipes/{dir}/{item.removeprefix('minecraft:')}"] = Advancement({
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
                "name": f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}",
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

            ctx.data[f"gm4_standard_crafting:crafting/{dir}/{output.removeprefix('minecraft:')}"] = LootTable({
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

            command: str = "execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:\"" + item + "\"},{Slot:1b,id:\"" + item + "\"},{Slot:3b,id:\"" + item + "\"},{Slot:4b,id:\"" + item + "\"}]} run loot replace block ~ ~ ~ container.0 loot " + f"gm4_standard_crafting:crafting/{dir}/{output.removeprefix('minecraft:')}"
            function.append(command)
    
    stairs_recipes = ctx.data[f"gm4_standard_crafting:stairs_recipes"] = Function(["##stairs"])
    stairs: list[str] = item_tags["minecraft:stairs"].data['values']
    recursive_apply(stairs, "stairs_decraft", ["##", "##"], 3, stairs_recipes)

    slabs_recipes = ctx.data[f"gm4_standard_crafting:slabs_recipes"] = Function(["##slabs"])
    slabs: list[str] = item_tags["minecraft:slabs"].data['values']
    recursive_apply(slabs, "slab_decraft", ["##","##"], 2, slabs_recipes)
