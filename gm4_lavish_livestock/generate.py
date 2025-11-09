from pathlib import Path
import logging

from beet import Context, subproject
from gm4.utils import CSV

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):

    # load csv
    csv = CSV.from_file(Path('gm4_lavish_livestock', 'raw', 'livestock.csv'))

    # prepare list of supported entities
    entity_ids = [e.get('entity_id', "").removeprefix('minecraft:').strip() for e in csv]

    # for each wood type in the vanilla doors tag, render a copy of the "templates" directory with the appropriate wood-type
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
