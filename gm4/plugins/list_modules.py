from beet import Context
import logging

logger = logging.getLogger("gm4")

def beet_default(ctx: Context):
	"""Displays how many modules are in the current directory."""
	modules = [p.name for p in sorted(ctx.directory.glob("gm4_*"))]
	logger.info(f"Found {len(modules)} modules")
