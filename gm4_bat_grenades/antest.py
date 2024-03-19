from beet import Context
import logging

def beet_default(ctx: Context):
    logger = logging.getLogger("gm4.output.smithed.gm4_bat_grenades")
    logger.info("Bat grenades successfully published on smithed", extra={"gh_annotate_skip": True})
    logger.info("Bat grenades successfully published on modrinth", extra={"gh_annotate_skip": True})

    logger = logging.getLogger("gm4.output.smithed.gm4_zauber_cauldrons")
    logger.info("Zauber Cauldrons successfully published on smithed", extra={"gh_annotate_skip": True})
    logger.info("Zauber Cauldrons successfully published on modrinth", extra={"gh_annotate_skip": True})

    logger = logging.getLogger("gm4.output.smithed.gm4_apple_trees")
    logger.info("Apple Trees successfully published on smithed", extra={"gh_annotate_skip": True})
