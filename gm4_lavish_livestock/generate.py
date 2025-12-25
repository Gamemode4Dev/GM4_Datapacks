import logging

from beet import Context, subproject

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    # List of supported entities
    # This list is defined in 2 other places, translations.csv and the guidebook
    entity_ids = [
        "chicken",
        "cow",
        "hoglin",
        "mooshroom",
        "pig",
        "rabbit",
        "sheep"
    ]
    ctx.meta['animals'] = entity_ids
    
    # for each supported entity, render a copy of the "templates" directory with the appropriate entity-id
    for entity in entity_ids:
        subproject_config = {
            "data_pack": {
                "load": [
                    {
                        f"data/gm4_lavish_livestock/advancement/{entity}": "data/gm4_lavish_livestock/templates/advancement",
                        f"data/gm4_lavish_livestock/function/{entity}": "data/gm4_lavish_livestock/templates/function",
                        f"data/gm4_lavish_livestock/loot_table/{entity}": "data/gm4_lavish_livestock/templates/loot_table",
                    }
                ],
                "render": {
                    "advancement": "*",
                    "function": "*",
                    "loot_table": "*"
                }
            },
            "meta": {
                "entity_id": entity
            }
        }

        ctx.require(subproject(subproject_config))
