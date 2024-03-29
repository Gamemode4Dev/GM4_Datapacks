import logging
import logging.handlers
import os
import re
from functools import partial
from pathlib import Path
from typing import Any

from beet import Context, ProjectCache

from gm4.plugins.manifest import ManifestCacheModel, ManifestFileModel


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
    sum_handler = SummaryHandler(1000, ctx.cache)
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
    def __init__(self, capacity: int, beet_cache: ProjectCache):
        super().__init__(capacity)
        self.beet_cache = beet_cache
        self.summary_created = False

    def flush(self):
        summary_entries: dict[str, Any] = {}

        this_manifest = ManifestCacheModel.parse_obj(self.beet_cache["gm4_manifest"].json)
        last_manifest = ManifestFileModel.parse_obj(self.beet_cache["previous_manifest"].json)

        this_versions = {id: entry.version for id, entry in (this_manifest.modules | this_manifest.libraries).items()}
        last_versions = {id: entry.version for id, entry in ({e.id: e for e in last_manifest.modules} | last_manifest.libraries).items()}

        library_ids = [e.id for e in this_manifest.libraries.values()]

        for record in self.buffer:
            if record.name.startswith("gm4.output"):
                _, _, service, module_id = record.name.split('.')
            elif record.name.startswith("gm4.manifest.update_patch"):
                module_id = getattr(record, "project_id")
                service = "gamemode4"
            else:
                continue

            if module_id in library_ids: # manifests store with "lib_" prefix
                module_id = module_id.replace("gm4_", "lib_")

            # init row
            if module_id not in summary_entries:
                summary_entries[module_id] = {
                    "name": module_id,
                    "ver_update": f"{last_versions.get(module_id, '?.?.?')} → {this_versions.get(module_id, '?.?.?')}",
                    "logs": [] # list of tuples ("smithed", log_message)
                }
            
            # append to logs
            summary_entries[module_id]["logs"].append((service, record.getMessage()))

        # form table entries from entries
        table = "Module | Version Update | Logs \n |-|:-:|-|"
        for entry in dict(sorted(summary_entries.items())).values():
            nested_table = "<details><table>"
            for service, message in entry['logs']:
                nested_table += f"<tr><td>{service}<td>{message}</tr>"
            nested_table += "</table></details>"

            table += f"\n {entry['name']} | {entry['ver_update']} | {nested_table}"
        
        summary = "# :rocket: Build Deployment Summary :rocket:\n"+table

        if not self.summary_created:
            env_file = os.getenv("GITHUB_STEP_SUMMARY")
            if env_file:
                with open(env_file, "a") as f:
                    f.write(summary) # python normally has no access to env variables, so we go direct to the action env file.
                self.summary_created = True
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
