from dataclasses import replace, dataclass, field
from mecha import Mecha, rule, MutatingReducer, Diagnostic#, AstNbtCompound, AstNbtCompoundEntry, AstJsonObjectEntry, AstNbt, NbtParser, MutatingReducer, AstNbtValue, AstChildren
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
import time

parent_logger = logging.getLogger("gm4.player_heads")

USER_AGENT = "Gamemode4Dev/GM4_Datapacks/player_head_management (gamemode4official@gmail.com)"


class Skin(PngFile):
    """Class representing a skin texture file."""
    scope: ClassVar[tuple[str, ...]] = ("skins",)
    extension: ClassVar[str] = ".png"
    image: ClassVar[FileDeserialize[Image]] = FileDeserialize() # FIXME this is here to try and fix type warnings

def beet_default(ctx: Context):
    ctx.data.extend_namespace.append(Skin) # register new filetype to datapack
    tf = ctx.inject(SkinNbtTransformer)
    ctx.inject(Mecha).transform.extend(tf)

    yield
    tf.log_unused_textures()
    tf.output_skin_cache()
    

def test(ctx: Context):
    print(ctx.data[Skin])
    # ctx.data[Skin]["gm4_heart_canisters:heart_canister_teir_2"] = Skin(source_path="base/pack.png")
    # ctx.data[Skin]["gm4_heart_canisters:test_img"] = Skin(Img.new("RGB", (128, 128), "red"))
    # res = mineskin_upload(ctx.data[Skin]["gm4_heart_canisters:heart_canister_teir_1"], "heart_canisters_teir_2.png")
    # print(res)
    # ctx.data[Skin]["gm4_heart_canisters:test_img"] = ctx.data[Skin]["gm4_heart_canisters:test_img"].image.rotate(45)
    # print(ctx.data[Skin])

class SkinNbtTransformer(MutatingReducer):
    # ctx: Context|None = None
    # skin_cache = JsonFile(source_path="gm4/skin_cache.json").data
    # used_textures: list[str] = field(default_factory=list)
    def __init__(self, ctx: Context):
        # NOTE better to bind not all of ctx
        self.ctx: Context = ctx
        self.skin_cache = JsonFile(source_path="gm4/skin_cache.json").data
        self.used_textures: list[str] = []
        super().__init__()

    @rule(AstNbtCompoundEntry)
    def skullowner_substitutions(self, node: AstNbtCompoundEntry) -> AstNbtCompoundEntry:
        if node.key.value == "SkullOwner":
            match node.value.evaluate():
                case String(val) if "$" in val:
                    skin_val, uuid = self.retrieve_texture(val)
                    node = replace(node, value=AstNbtCompound.from_value({
                        "Id": IntArray(uuid),
                        "Properties": {
                            "textures":[{
                                "Value": skin_val
                            }]
                        }
                    }))
                case Compound({"Value": String(val), **rest}) if "$" in val: # type: ignore
                    skin_val, uuid = self.retrieve_texture(val)
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=rest.get("Name")) else {}) | # type: ignore
                        {"Id": IntArray(uuid),
                         "Properties": {
                            "textures":[
                                {"Value": "1234567890abcdef="} | 
                                ({"Signature": s} if (s:=rest.get("Signature")) else {})] # type: ignore
                            }
                        }
                    ))
                case Compound({"Properties": Compound({"textures": List([Compound({"Value": String(val), **tex_rest})])}), **root_rest}) if "$" in val: # type: ignore
                    skin_val, uuid = self.retrieve_texture(val)
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=root_rest.get("Name")) else {}) | # type: ignore
                        {"Id": IntArray(uuid),
                         "Properties": {
                            "textures":[
                                {"Value": "1234567890abcdef="} | 
                                ({"Signature": s} if (s:=tex_rest.get("Signature")) else {})] # type: ignore
                            }
                        }
                    ))
                case _:
                    if "$" in node.value.evaluate().snbt():
                        raise Diagnostic("warn", f"Unhandled SkullOwner substitution. Format failed to match known schemas.")
        return node
    
    def retrieve_texture(self, skin_name: str):
        skin_name = skin_name.lstrip("$")
        if ":" not in skin_name:
            skin_name = f"{self.ctx.project_id}:{skin_name}"
        cached_data = self.skin_cache["skins"].get(skin_name, {"hash": None})

        try:
            skin_file: Skin = self.ctx.data[Skin][skin_name]
        except KeyError:
            raise Diagnostic("error", f"Unknown skin \'{skin_name}\'") # TODO when processing json sources, pass filename down to here if posible
        
        self.used_textures.append(skin_name)
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
            return value, uuid
        return cached_data["value"], cached_data["uuid"]
    
    def output_skin_cache(self):
        JsonFile(self.skin_cache).dump(origin="", path="gm4/skin_cache.json")

    def mineskin_upload(self, skin: Skin, filename: str) -> tuple[str|None, list[int]|None]:
        logger = parent_logger.getChild(f"mineskin_upload.{self.ctx.project_id}")
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
            logger.info(f"Mineskin request ratelimited! Waiting and trying again")
            next_request_time = res.json()["nextRequest"]
            wait_time = max(next_request_time - time.time(), 0)
            time.sleep(wait_time)
            return self.mineskin_upload(skin, filename)
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
        signed_int: Callable[[str], int] = lambda s: int.from_bytes(bytes.fromhex(s), byteorder="big", signed=True)
        uuid_arr = list(map(signed_int, segmented_uuid))
        return trimmed_value, uuid_arr
    
    def log_unused_textures(self):
        logger = parent_logger.getChild(self.ctx.project_id)
        cached_member_textures = [e for e in self.skin_cache["skins"].keys() if e.split(":")[0] == self.ctx.project_id]
        for tex in set(cached_member_textures) - set(self.used_textures):
            logger.info(f"Cached skin texture {tex} is not referenced. Consider manually cleaning up skin_cache.json")

def process_json_files(ctx: Context):
    """Passes nbt contained in advancements, loot_tables ect.. through the custom Mecha AST rule for appropiate texture replacements"""
    tf = ctx.inject(SkinNbtTransformer)
    mc = ctx.inject(Mecha)

    for jsonfile in [*ctx.data.loot_tables.values(), *ctx.data.item_modifiers.values(), *ctx.data.advancements.values()]:
        # retrieve instances of nbt data
        if type(jsonfile.data) is list: # FIXME what are these special cases?
            continue
        if "guidebook" in str(jsonfile.data):
            continue
        for entry in nested_get(jsonfile.data, "nbt")+nested_get(jsonfile.data, "tag"):
            print(entry)
            node = mc.parse(entry, type=AstNbtCompound) # parse string to AST
            entry = mc.serialize(tf(node)) # run AST through custom rule, and serialize bacn to string
            print(entry)


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
        self.token = token_cache
