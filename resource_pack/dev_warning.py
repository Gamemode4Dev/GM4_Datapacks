from beet import Context
import logging

logger = logging.getLogger("gm4.gm4_resource_pack")

def beet_default(ctx: Context):
    if ctx.meta.get("gm4_dev"):
        logger.error("The resource pack cannot be cherry-picked by the 'beet dev' command - it inherits all its resources from other modules as they are built by the beet pipeline. If a full build is necessary, use the full project build 'beet build', otherwise just list the desired module(s) in 'beet dev' and use the partial resource pack output.")
