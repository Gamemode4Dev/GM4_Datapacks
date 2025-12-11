# beet plugin to generate lists of items of each stack size, using misodes mcmeta git repo

import json
from beet import ProjectCache
from gm4.utils import add_namespace

def retrieve_stacksizes(cache: ProjectCache, version: str) -> tuple[list[str], list[str], list[str]]:
    # retrieve item_components.json
    url = f"https://raw.githubusercontent.com/misode/mcmeta/refs/tags/{version}-summary/item_components/data.json"
    path = cache["mcmeta_stacksize"].download(url)
    with open(path) as f:
        default_components = json.load(f)

    # parse components into stack size lists
    unstackables: list[str] = []
    stackable_16: list[str] = []
    stackable_64: list[str] = []

    for item_id, components in default_components.items():
        match components["minecraft:max_stack_size"]:
            case 1:
                unstackables.append(add_namespace(item_id, "minecraft"))
            case 16:
                stackable_16.append(add_namespace(item_id, "minecraft"))
            case 64:
                stackable_64.append(add_namespace(item_id, "minecraft"))
            case _:
                pass

    return unstackables, stackable_16, stackable_64
