from beet import Context
import logging
import logging.handlers
import re
from functools import partial
from pathlib import Path

def beet_default(ctx: Context):
    """Sets up a logging handlers to emit build log entries with the github action annotation format, 
        and create a summary with useful build information."""
    root_logger = logging.getLogger(None) # get root logger

    # annotation handler emits throughout build to stderr
    ann_handler = logging.StreamHandler()
    ann_handler.setFormatter(AnnotationFormatter())

    def filter(record: logging.LogRecord):
        if record.name == "time":
            return False # disable annotations for time - is spammy in debug mode
        return True
    ann_handler.addFilter(filter)

    root_logger.handlers.clear() # clear the handler set by beet CLI toolchain
    root_logger.addHandler(ann_handler)
    
    # summary handler holds onto certain records until the exit phase when it emits to a markdown summary
    sum_handler = SummaryHandler(1000)
    logging.getLogger("gm4.output").addHandler(sum_handler)
    logging.getLogger("gm4.manifest.update_patch").addHandler(sum_handler)

    # after the whole build, flush the stored records and form the markdown summary
    yield
    sum_handler.flush()

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
        
        level = LEVEL_CONVERSION.get(record.levelno, LEVEL_CONVERSION[logging.INFO])

        filename = None
        line = None
        col = None

        if getattr(record, "gh_annotate_skip", False): # disable annotations for any gm4 log events flagged manually
            return f"{level.capitalize()}: {record.name} {expl}" # formatted to resemble annotated entry
        
        match = re.match(r"(.+):(\d+):(\d+)", getattr(record, "annotate", "")) # extract filename and location from mecha annotation
        if match:
            filename, line, col = match.groups()
            return f"::{level} file={filename},line={line},col={col},title={record.name}::{record.name} {expl}"

        return f"::{level} title={record.name}::{record.name} {expl}"
        
class SummaryHandler(logging.handlers.BufferingHandler):

    def flush(self):
        print("flush called")
        for record in self.buffer:
            print(record)
        self.buffer.clear()

    

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
