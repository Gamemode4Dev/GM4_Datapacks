from beet import Context
import logging

logger = logging.getLogger("gm4")

def beet_default(ctx: Context):
	logger.info("Finished!")
