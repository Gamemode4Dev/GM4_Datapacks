from beet import Context, Recipe, Advancement
from beet.contrib.vanilla import Vanilla
from gm4_guidebook.generate_guidebooks import CustomCrafterRecipe
import logging

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    """generates recipes for stair and slab decrafting
        NOTE: only generates the guidebook definitions - future work will generate function definitions too"""
    
    vanilla = ctx.inject(Vanilla)
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
    recipes = vanilla.mount("data/minecraft/recipe").data.recipes

    def recursive_apply(items: list[str], dir: str, shape: list[str], output_count: int):
        for item in items:
            if "#" in item:
                recursive_apply(item_tags[item.lstrip("#")].data["values"], dir, shape, output_count)
                continue

            # get full block id from the vanilla stair recipe
            recipe = recipes.get(item)
            if not recipe:
                logger.debug(f"No vanilla recipe found for {item}, skipping")
                continue
            input = recipe.data["key"]["#"]
            if isinstance(input, list):
                output: str = input[0]["item"] # type: ignore
            else:
                output: str = input["item"]

            recipe_path = f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}"

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
                ctx.data[output] = Recipe(output_recipe.data)


            ctx.data[recipe_path] = Recipe({
                "type": "minecraft:crafting_shaped",
                "category": "building",
                "group": group, #type: ignore
                "pattern": shape,
                "key": {
                    "#": {
                        "item": item
                    }
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

    stairs: list[str] = item_tags["minecraft:stairs"].data['values']
    recursive_apply(stairs, "stairs_decraft", ["##", "##"], 4)

    slabs: list[str] = item_tags["minecraft:slabs"].data['values']
    recursive_apply(slabs, "slab_decraft", ["#", "#"], 1)
