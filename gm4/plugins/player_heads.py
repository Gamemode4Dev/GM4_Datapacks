from dataclasses import replace, dataclass
from mecha import Mecha, rule, AstNbtCompoundEntry, AstJsonObjectEntry, AstNbt, NbtParser, MutatingReducer
from beet import Context, JsonFile, Function
from gm4.utils import nested_get
import json
import os
from nbtlib import String

from beet import Context, PngFile, DataPack, NamespaceProxy
import PIL.Image as Image
from typing import ClassVar
import hashlib
from beet.core.utils import required_field

class Skin(PngFile):
    """Class representing a skin texture file."""
    scope: ClassVar[tuple[str, ...]] = ("skins",)
    extension: ClassVar[str] = ".png"

    def bind(self, pack: "DataPack", path: str):
        super().bind(pack, path)

        # deserializes file now for cache comparisons

        # print(f"{self.image}")
        # print(f"hash of skin is {hashlib.sha1(self.image.tobytes()).hexdigest()}")
        # TODO we shouldn't process hash on bind, rather search the pack for the right skin when the AST node encounters the reference


def beet_default(ctx: Context):
    # register new container to datapack 
    ctx.data.extend_namespace.append(Skin)
    ctx.inject(Mecha).transform.extend(SkinNbtTransformer(skins_container=ctx.data[Skin]))
    

def test(ctx: Context):
    print(ctx.data[Skin])
    ctx.data[Skin]["gm4_heart_canisters:heart_canister_teir_2"] = Skin(source_path="base/pack.png")
    ctx.data[Skin]["gm4_heart_canisters:test_img"] = Skin(Image.new("RGB", (128, 128), "red"))
    # ctx.data[Skin]["gm4_heart_canisters:test_img"] = ctx.data[Skin]["gm4_heart_canisters:test_img"].image.rotate(45)
    print(ctx.data[Skin])

@dataclass
class SkinNbtTransformer(MutatingReducer):
    skins_container: NamespaceProxy[Skin] = required_field()

    @rule(AstNbtCompoundEntry)
    def extra_nbt(self, node: AstNbtCompoundEntry) -> AstNbtCompoundEntry:
        # print(node.key)
        # print(str(node.value.evaluate()))
        # print(node.evaluate())
        # modified = AstNbtCompound.from_value(node.evaluate() | {"foo": "bar"})
        # if node != modified:
        #     return modified
        # return node
        # return replace(node, value=56)
        if node.key.value == "SkullOwner":
            print(node.value.evaluate())
            print(self.skins_container)
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
