import logging

from beet import Context, subproject

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    # List of supported swing colors defined in beet.yaml as well as the guidebook page
    # for each supported swing color, generate all required code
    for color in ctx.meta['colors']:
        subproject_config = {
            "resource_pack": {
                "load": [
                    {
                        f"assets/gm4_swings/items/swings/{color}.json": "assets/gm4_swings/templates/items/swing.json",
                        f"assets/gm4_swings/models/item/swings/{color}.json": "assets/gm4_swings/templates/models/item/swing.json",
                        f"assets/gm4_swings/models/block/swings/{color}.json": "assets/gm4_swings/templates/models/block/swing.json"
                    }
                ],
                "render": {
                    "item_model": "*",
                    "model": "*"
                }
            },
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_swings/loot_table/swings/{color}.json": "data/gm4_swings/templates/loot_table/swing.json",
                        f"data/gm4_swings/recipe/swings/{color}.json": "data/gm4_swings/templates/recipe/swing.json",
                        f"data/gm4_swings/advancement/recipes/swings/{color}.json": "data/gm4_swings/templates/advancement/recipes/swing.json"
                    }
                ],
                "render": {
                    "loot_table": "*",
                    "recipe": "*",
                    "advancement": "*"
                }
            },
            "meta": {
                "swing_color": color
            }
        }

        ctx.require(subproject(subproject_config))
