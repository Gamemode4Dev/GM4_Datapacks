from beet import Context, Recipe, Advancement
from beet.contrib.vanilla import Vanilla
import logging

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    """
        - generates recipes for stair and slab decrafting
        - groups recipes that have existing vanilla recipes
    """
    
    vanilla = ctx.inject(Vanilla)
    vanilla.minecraft_version = '1.21.11'
    item_tags = vanilla.mount("data/minecraft/tags/item").data.item_tags
    recipes = vanilla.mount("data/minecraft/recipe").data.recipes

    def group_recipe(output: str) -> str:
        output = output.removeprefix('minecraft:') # remove prefix
        output_recipe = recipes.get("minecraft:" + output)
        if output_recipe is None: # no recipe
            return output
        elif "group" in output_recipe.data: # recipe with group
            return output_recipe.data["group"]
        else: # recipe but no group, add it
            group: str = output
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
            ctx.data["minecraft:" + output] = Recipe(output_recipe.data)
            return group

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
            input: str | list[str] = recipe.data["key"]["#"]
            if isinstance(input, list):
                output = input[0]
            else:
                output = input

            recipe_path = f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}"

            group = group_recipe(output)

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

    stairs: list[str] = item_tags["minecraft:stairs"].data['values']
    recursive_apply(stairs, "stairs_decraft", ["##", "##"], 3)
    slabs: list[str] = item_tags["minecraft:slabs"].data['values']
    recursive_apply(slabs, "slab_decraft", ["##","##"], 2)

    for recipe in [
        "dispenser", "bone_block"
    ]:
        group_recipe(recipe)
