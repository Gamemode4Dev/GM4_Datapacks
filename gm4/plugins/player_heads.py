from dataclasses import replace
from mecha import Mecha, rule, AstNbtCompoundEntry, AstJsonObjectEntry, AstNbt, NbtParser
from beet import Context, JsonFile, Function
from gm4.utils import nested_get
import json
import os
from nbtlib import String

from beet import Context, PngFile
from typing import ClassVar

class Skin(PngFile):
    """Class representing a skin texture file."""
    scope: ClassVar[tuple[str, ...]] = ("skins",)
    extension: ClassVar[str] = ".png"

def beet_default(ctx: Context):
    # register new container to datapack 
    ctx.data.extend_namespace.append(Skin)

def test(ctx: Context):
    print(ctx.data[Skin])

@rule(AstNbtCompoundEntry)
def extra_nbt(node: AstNbtCompoundEntry) -> AstNbtCompoundEntry:
    # print(node.key)
    # print(str(node.value.evaluate()))
    # print(node.evaluate())
    # modified = AstNbtCompound.from_value(node.evaluate() | {"foo": "bar"})
    # if node != modified:
    #     return modified
    # return node
    # return replace(node, value=56)
    # if node.key.value == "SkullOwner":
        # print(f"found SkullOwner! {node.value.evaluate()}")
        # val = node.value.evaluate()
        # if type(val) is String:
        #     return node
        # uuid = val.get("Id")
        # if uuid is not None:
        #     uuid = uuid.snbt()
        # value = str(val.get("Properties", {}).get("textures", [{}])[0].get("Value"))
        # if value == "None":
        #     value=None
        # name = str(val.get("Name")) if val.get("Name") is not None else None
        # # print(f"{uuid}, {value}, {name}")
        # # print(os.listdir("gm4"))

        # if value is not None:
        #     with open("gm4/skin_cache.json", "r+") as f:
        #         # print("file opened")
        #         # print(f.readlines())
        #         data = json.load(f)
        #         # print(data)
        #         found_skin = False
        #         for skin in data["skins"]:
        #             if skin["value"] == value:
        #                 found_skin = True
        #                 # print("found the skin already")
        #                 if skin["name"] == None and name is not None: # attempt to update name
        #                     print(f"updatin name to {name}")
        #                     skin["name"] = name
        #                 if skin["uuid"] == None and uuid is not None: # attempt to update uuid
        #                     skin["uuis"] = uuid
        #                 else:
        #                     skin = {"uuid": uuid, "value": value, "name": name}
        #         if not found_skin:
        #             data["skins"].append({"uuid": uuid, "value": value, "name": name})
        #             # print(data)
        #         f.seek(0)
        #         json.dump(data, f, indent=2, )
                # f.write(str(data))




    # if node.key.value == "SkullOwner" and "$" in str(value:=node.value.evaluate()):
    #     return replace(node, value=AstNbt.from_value({"test":"values"}))
    return node

# FAILURE, this only ast's the stuff in commands
# @rule(AstJsonObjectEntry)
# def test(node: AstJsonObjectEntry) -> AstJsonObjectEntry:
#     print(node)
#     return node

# def reset_skin_cache(ctx):
#     # reset cache
#     cache_file = JsonFile('{"skins":[]}')
#     # print(cache_file)
#     # save file out
#     cache_file.dump("gm4", "skin_cache.json")

# def beet_default(ctx: Context):

    # functions
    # ctx.inject(Mecha).transform.extend(extra_nbt)
    # mc = ctx.inject(Mecha)
    # mc.transform.extend(extra_nbt) # yea this wasn't quite working right

    # loot tables, item modifiers, and advancements
    # dummy_parse_function = Function("")

    # for jsonfile in [*ctx.data.loot_tables.values(), *ctx.data.item_modifiers.values(), *ctx.data.advancements.values()]:
    #     # retrieve instances of nbt data
    #     if type(jsonfile.data) is list:
    #         continue
    #     if "guidebook" in str(jsonfile.data):
    #         continue
    #     for entry in nested_get(jsonfile.data, "nbt")+nested_get(jsonfile.data, "tag"):
    #         # mc.parse(f"summon marker ~ ~ ~ {entry}")
    #         if entry[0] == '{':
    #             dummy_parse_function.append(f"summon marker ~ ~ ~ {entry}") # focre mecha to process nbt since I don't know how to submit it directly
    # ctx.data.functions["minecraft:mecha_dummy"] = dummy_parse_function
