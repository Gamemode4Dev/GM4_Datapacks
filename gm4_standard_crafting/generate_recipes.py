from beet import Context
from beet.contrib.vanilla import Vanilla
from gm4_guidebook.generate_guidebooks import CustomCrafterRecipe
import logging

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    """generates recipes for stair and slab decrafting
        NOTE: only generates the guidebook definitions - future work will generate function definitions too"""
    
    vanilla = ctx.inject(Vanilla)
    item_tags = vanilla.mount("data/minecraft/tags/items").data.item_tags
    recipes = vanilla.mount("data/minecraft/recipes").data.recipes

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

            ctx.data[f"gm4_standard_crafting:{dir}/{item.removeprefix('minecraft:')}"] = CustomCrafterRecipe({
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
    recursive_apply(slabs, "slabs_decraft", ["#", "#"], 1)
