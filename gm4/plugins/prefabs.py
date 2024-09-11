from beet import Context, PluginOptions, configurable
from beet.contrib.find_replace import find_replace
from beet.contrib.rename_files import rename_files
from pydantic.v1 import Extra
import nbtlib # type: ignore ; no stub file
import re
from gm4.plugins.manifest import repro_structure_to_bytes


class PrefabConfig(PluginOptions, extra=Extra.ignore):
    prefabs: list[str]

def beet_default(ctx: Context):
    """Handles renaming of prefab assets as they merge into a for modules use"""
    prefab_namespace = ctx.project_id
    module_namsepace = ctx.cache["currently_building"].json["id"]
    
    structure_deep_rename(ctx, prefab_namespace, module_namsepace)

@configurable("gm4", validator=PrefabConfig)
def module_asset_rename(ctx: Context, opts: PrefabConfig):
    """Handles renaming of prefab assets already present in module folder"""
    for prefab in opts.prefabs:
        structure_deep_rename(ctx, prefab, ctx.project_id)

def structure_deep_rename(ctx: Context, find_namespace: str, repl_namespace: str):
    """Renames and updates file references, including those contained within structure block data such as loot tables and structure pools"""
    # rename files
    ctx.require(rename_files(data_pack={
        "match": "*",
        "find": f"{find_namespace}:([a-z0-9_/]+)",
        "replace": f"{repl_namespace}:\\1"
    }))

    # rename text-file references
    ctx.require(find_replace(data_pack={"match": "*"}, substitute={
        "find": f"{find_namespace}:([a-z0-9_/]+)",
        "replace": f"{repl_namespace}:\\1"
    }))

    # rename structure-file references
    for s in ctx.data.structures:
        blocks = ctx.data.structures[s].data["blocks"].snbt() # type: ignore ; nbtlib typing missing
        updated_blocks_data = re.sub(f"{find_namespace}:([a-z0-9_/]+)", f"{repl_namespace}:\\1", blocks) # type: ignore ; nbtlib typing missing
        ctx.data.structures[s].serializer = repro_structure_to_bytes
        ctx.data.structures[s].data["blocks"] = nbtlib.parse_nbt(updated_blocks_data) # type: ignore ; nbtlib typing missing
