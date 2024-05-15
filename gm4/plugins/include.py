from beet import Context, subproject
from functools import cache
import logging

# for importing libraries into a module, with logic to prevent double imports

logger = logging.getLogger("gm4.include")

__path__ = ""

@cache
def __getattr__(name: str): # redirect plugin calls to the right library dynamically
    def plugin(ctx: Context):
        # load subproject, if not already present
        logger.info(f"Include library {name} in project {ctx.project_id} | currently building: {ctx.cache['currently_building'].json}")
        added_libs = ctx.cache['currently_building'].json['added_libs']
        if name not in added_libs:
            ctx.require(subproject({'directory': f'../{name}', 'extend': 'beet.yaml'}))
            added_libs.append(name)
    return plugin
