from beet import Context
import logging
import re
from functools import partial
from pathlib import Path

def beet_default(ctx: Context):
    """Sets up a logging handler to repeat build log entries with the github action annotation format"""
    root_logger = logging.getLogger(None) # get root logger

    handler = logging.StreamHandler()
    handler.setFormatter(AnnotationFormatter())

    root_logger.addHandler(handler)

def add_module_dir_to_diagnostics(ctx: Context):
    """Sets up a logging record factory that prepends the proper module folder to mecha diagnostics"""
    local_filter = partial(add_mecha_subproject_dir, subproject_dir=ctx.directory.stem)
    mc_logger = logging.getLogger("mecha")
    mc_logger.addFilter(local_filter)

    yield
    mc_logger.removeFilter(local_filter) # clear the filter once done (after mecha)


LEVEL_CONVERSION = {
    logging.DEBUG: "debug",
    logging.INFO: "notice",
    logging.WARNING: "warning",
    logging.ERROR: "error",
    logging.CRITICAL: "error"
}

class AnnotationFormatter(logging.Formatter):
    
    def format(self, record: logging.LogRecord) -> str:
        expl = record.message.split("\n")[0]

        filename = None
        line = None
        col = None
        match = re.match(r"(.+):(\d+):(\d+)", getattr(record, "annotate", ""))
        if match:
            filename, line, col = match.groups()

        level = LEVEL_CONVERSION.get(record.levelno, logging.INFO)
        return f"::{level} file={filename},line={line},col={col}::{expl}"
    
def add_mecha_subproject_dir(record: logging.LogRecord, subproject_dir: str|Path = ""):
    if d:=getattr(record, "annotate"):
        record.annotate = f"{subproject_dir}/{d}" # modify record in place
    return True
