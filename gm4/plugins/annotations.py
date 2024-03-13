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

    def filter(record: logging.LogRecord):
        if record.name == "time":
            return False # disable annotations for time - is spammy in debug mode
        return True

    handler.addFilter(filter)

    root_logger.handlers.clear() # clear the handler set by beet CLI toolchain
    root_logger.addHandler(handler)

LEVEL_CONVERSION = {
    logging.DEBUG: "debug",
    logging.INFO: "notice",
    logging.WARNING: "warning",
    logging.ERROR: "error",
    logging.CRITICAL: "error"
}

class AnnotationFormatter(logging.Formatter):
    
    def format(self, record: logging.LogRecord) -> str:
        expl = record.getMessage().replace("\n", "%0A")
            # use urlencoded newline
        
        level = LEVEL_CONVERSION.get(record.levelno, logging.INFO)

        filename = None
        line = None
        col = None
        match = re.match(r"(.+):(\d+):(\d+)", getattr(record, "annotate", ""))
        if match:
            filename, line, col = match.groups()
            return f"::{level} file={filename},line={line},col={col},title={record.name}::{expl}"

        return f"::{level} title={record.name}::{expl}"
        
    

def add_module_dir_to_diagnostics(ctx: Context):
    """Sets up a logging record filter that prepends the proper module folder to mecha diagnostics"""
    local_filter = partial(add_mecha_subproject_dir, subproject_dir=ctx.directory.stem)
    mc_logger = logging.getLogger("mecha")
    mc_logger.addFilter(local_filter)

    yield
    mc_logger.removeFilter(local_filter) # clear the filter once done (after mecha)
    

def add_mecha_subproject_dir(record: logging.LogRecord, subproject_dir: str|Path = ""):
    if d:=getattr(record, "annotate"):
        record.annotate = f"{subproject_dir}/{d}" # modify record in place
    return True
