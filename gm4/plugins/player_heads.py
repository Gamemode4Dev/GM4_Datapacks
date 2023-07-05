from dataclasses import replace, dataclass
from mecha import Mecha, rule, MutatingReducer#, AstNbtCompound, AstNbtCompoundEntry, AstJsonObjectEntry, AstNbt, NbtParser, MutatingReducer, AstNbtValue, AstChildren
from mecha.ast import *
from beet import Context, JsonFile, Function, FileDeserialize
from gm4.utils import nested_get
import json
import os
from nbtlib import *

from beet import Context, PngFile, DataPack, NamespaceProxy
from PIL import Image as Img
from PIL.Image import Image
from typing import ClassVar, Callable
import hashlib
from beet.core.utils import required_field
import logging
import base64
import requests
from io import BytesIO, TextIOWrapper
from functools import cache

parent_logger = logging.getLogger("gm4.player_heads")

USER_AGENT = "Gamemode4Dev/GM4_Datapacks/player_head_management (gamemode4official@gmail.com)"


class Skin(PngFile):
    """Class representing a skin texture file."""
    scope: ClassVar[tuple[str, ...]] = ("skins",)
    extension: ClassVar[str] = ".png"
    image: ClassVar[FileDeserialize[Image]] = FileDeserialize() # FIXME this is here to try and fix type warnings

    def bind(self, pack: "DataPack", path: str):
        super().bind(pack, path)

        # deserializes file now for cache comparisons

        # print(f"{self.image}")
        # print(f"hash of skin is {hashlib.sha1(self.image.tobytes()).hexdigest()}")
        # TODO we shouldn't process hash on bind, rather search the pack for the right skin when the AST node encounters the reference

        # maybe we keep a record of which skins are used so we can warn on unused textures?


def beet_default(ctx: Context):
    # register new container to datapack 
    ctx.data.extend_namespace.append(Skin)
    tf = SkinNbtTransformer(skins_container=ctx.data[Skin], ctx=ctx)
    ctx.inject(Mecha).transform.extend(tf)
    
    yield
    tf.output_skin_cache()

    

def test(ctx: Context):
    print(ctx.data[Skin])
    ctx.data[Skin]["gm4_heart_canisters:heart_canister_teir_2"] = Skin(source_path="base/pack.png")
    ctx.data[Skin]["gm4_heart_canisters:test_img"] = Skin(Img.new("RGB", (128, 128), "red"))
    # res = mineskin_upload(ctx.data[Skin]["gm4_heart_canisters:heart_canister_teir_1"], "heart_canisters_teir_2.png")
    # print(res)
    # ctx.data[Skin]["gm4_heart_canisters:test_img"] = ctx.data[Skin]["gm4_heart_canisters:test_img"].image.rotate(45)
    # print(ctx.data[Skin])

@dataclass
class SkinNbtTransformer(MutatingReducer):
    skins_container: NamespaceProxy[Skin] = required_field()
    ctx: Context = required_field() # FIXME is this a smart idea? I dunno but I need the project_id in the parser soooooo yea
    skin_cache = JsonFile(source_path="gm4/skin_cache.json").data

    @rule(AstNbtCompoundEntry)
    def extra_nbt(self, node: AstNbtCompoundEntry) -> AstNbtCompoundEntry:
        # modified = AstNbtCompound.from_value(node.evaluate() | {"foo": "bar"})
        # if node != modified:
        #     return modified
        if node.key.value == "SkullOwner":
            # print(node.value.evaluate())
            match node.value.evaluate():
                case String(val) if "$" in val:
                    skin_val = self.retrieve_texture(val)
                    node = replace(node, value=AstNbtCompound.from_value({
                        "Properties": {
                            "textures":[{
                                "Value": skin_val
                            }]
                        }
                    }))
                case Compound({"Value": String(val), **rest}) if "$" in val: # type: ignore
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=rest.get("Name")) else {}) | # type: ignore
                        {"Properties": {
                            "textures":[
                                {"Value": "1234567890abcdef="} | 
                                ({"Signature": s} if (s:=rest.get("Signature")) else {})] # type: ignore
                            }
                        }
                    ))
                case Compound({"Properties": Compound({"textures": List([Compound({"Value": String(val), **tex_rest})])}), **root_rest}) if "$" in val: # type: ignore
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=root_rest.get("Name")) else {}) | # type: ignore
                        {"Properties": {
                            "textures":[
                                {"Value": "1234567890abcdef="} | 
                                ({"Signature": s} if (s:=tex_rest.get("Signature")) else {})] # type: ignore
                            }
                        }
                    ))
                case _:
                    pass
        return node
    
    # @cache # FIXME? can this be caches?
    def retrieve_texture(self, skin_name: str):
        skin_name = skin_name.lstrip("$")
        if ":" not in skin_name:
            skin_name = f"{self.ctx.project_id}:{skin_name}"
        cached_data = self.skin_cache["skins"].get(skin_name, {"hash": None})

        skin_file: Skin = self.skins_container[skin_name] # FIXME bubble error on missing reference
        skin_hash = hashlib.sha1(skin_file.image.tobytes()).hexdigest()

        if skin_hash != cached_data["hash"]:
            # the image file contents have changed - upload the new image
            value, uuid = self.mineskin_upload(skin_file, f"{skin_name.split(':')[-1]}.png")
            self.skin_cache["skins"][skin_name] = {
                "uuid": uuid,
                "value": value,
                "name": "foo",
                "hash": skin_hash
            }
            return value
        return cached_data["value"]
    
    def output_skin_cache(self):
        JsonFile(self.skin_cache).dump(origin="", path="gm4/skin_cache.json")

    def mineskin_upload(self, skin: Skin, filename: str) -> tuple[str|None, str|None]:
        logger = parent_logger.getChild("mineskin_upload")
        token = self.ctx.inject(MineskinAuthManager).token

        buf = BytesIO()
        skin.image.save(buf, format="PNG")
        res = requests.post(   
            url='https://api.mineskin.org/generate/upload',
            data={"name":"GM4_Skin", "visibility":0},
            files={"file":(filename, buf.getvalue(), 'text/x-spam')},
            headers={"User-Agent": USER_AGENT, "Authorization": "Bearer "+token}
        )
        if res.status_code == 429:
            pass # FIXME, request sent too soon
        elif res.status_code != 200:
            logger.error(f"Mineskin upload failed: {res.status_code} {res.text}")
            return None, None
        logger.info(f"New skin texture \'{filename}\' successfully uploaded via Mineskin")
        
        # strip out unnecessary fields encoded within texture value
        value = res.json()["data"]["texture"]["value"]
        decoded_value = json.loads(base64.b64decode(value).decode('utf-8'))
        trimmed_decoded_value = {"textures": {"SKIN": {"url": decoded_value["textures"]["SKIN"]["url"]}}}
        trimmed_value = str(base64.b64encode(str(trimmed_decoded_value).encode('utf-8')), 'utf-8')

        uuid = res.json()["uuid"]
        i = range(0,33,8)
        segmented_uuid = [uuid[a:b] for a,b in zip(i, i[1:])]
        signed_int: Callable[[str], str] = lambda s: str(int.from_bytes(bytes.fromhex(s), byteorder="big", signed=True))
        uuid_arr = f"[I; {', '.join(map(signed_int, segmented_uuid))}]"
        return trimmed_value, uuid_arr

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

class MineskinAuthManager():

    def __init__(self, ctx: Context):
        token_cache = ctx.cache.get("mineskin").json.get("token") # type: ignore , cache.get ensures cache exists
        print(token_cache)

        if token_cache is None:
            # request token from user
            print(("\033[93mThis build has detected a changed skin file, but no Mineskin API key is available locally.\n\t"
                  "Visit mineskin.org/account, login or create an account with google, and create an API key.\n\t"
                  "Beet will cache your token locally, but save the api key and key secret in a secure location in case the cache resets.\n\t"
                  "You do not need to provide mineskin with your Minecraft account details unless you wish to\033[0m."))
            self.token = input("API Key >>")
            ctx.cache["mineskin"].json = {"token": self.token}
            return
        self.token = token_cache.json["token"]
