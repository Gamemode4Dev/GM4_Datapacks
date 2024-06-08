import base64
import hashlib
import json
import logging
import os
import sys
import time
from dataclasses import replace
from io import BytesIO
from typing import Any, Callable, ClassVar

import requests
from beet import Context, FileDeserialize, JsonFile, PngFile
from mecha import Diagnostic, Mecha, MutatingReducer, rule
from mecha.ast import (
    AstJsonObject,
    AstJsonObjectEntry,
    AstJsonObjectKey,
    AstNbtCompound,
    AstNbtCompoundEntry,
    AstNbtCompoundKey,
)
from PIL.Image import Image

from gm4.utils import InvokeOnJsonNbt

parent_logger = logging.getLogger("gm4.player_heads")

USER_AGENT = "Gamemode4Dev/GM4_Datapacks/player_head_management (gamemode4official@gmail.com)"
MISSING_TEXTURE_SKIN = "eyJ0ZXh0dXJlcyIgOiB7ICJTS0lOIiA6IHsgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kYWUyOTA0YTI4NmI5NTNmYWI4ZWNlNTFkNjJiZmNjYjMyY2IwMjc0OGY0NjdjMDBiYzMxODg1NTk4MDUwNThiIn19fQ=="

def beet_default(ctx: Context):
    ctx.data.extend_namespace.append(Skin) # register new filetype to datapack
    tf = ctx.inject(SkinNbtTransformer)
    ctx.inject(Mecha).transform.extend(tf) # register new ruleset to mecha
    ctx.require("mecha.contrib.json_files")

    yield
    tf.cache_nonnative_references()
    tf.log_unused_textures()
    tf.output_skin_cache()
    ctx.data[Skin].clear() # cleanup skin files from output pack

class Skin(PngFile):
    """Class representing a skin texture file."""
    scope: ClassVar[tuple[str, ...]] = ("skins",)
    extension: ClassVar[str] = ".png"
    image: ClassVar[FileDeserialize[Image]] = FileDeserialize() # purely here to solve type-warnings on PIL images
    

class SkinNbtTransformer(MutatingReducer, InvokeOnJsonNbt):
    """Reducer class defining custom mecha parsing rules for skin texture data, and storing needed data for those operations"""
    def __init__(self, ctx: Context):
        self.ctx: Context = ctx
        self.skin_cache = JsonFile(source_path="gm4/skin_cache.json").data
        self.used_textures: list[str] = []
        super().__init__()

    @rule(AstJsonObjectEntry, key=AstJsonObjectKey(value='minecraft:profile'))
    def json_substitutions(self, node: AstJsonObjectEntry, **kwargs: Any):
        reference = node.value.evaluate()
        if isinstance(reference, str) and reference.startswith("$"):
            skin_val, uuid, d = self.retrieve_texture(reference, **kwargs)
            if d:
                yield d
            node = replace(node, value=AstJsonObject.from_value({
                "id": uuid,
                "properties": [
                    {
                        "name": "textures",
                        "value": skin_val,
                    }
                ]
            }))
        return node

    @rule(AstNbtCompoundEntry, key=AstNbtCompoundKey(value='minecraft:profile'))
    def cmd_substitutions_nbt(self, node: AstNbtCompoundEntry, **kwargs: Any):
        reference = node.value.evaluate()
        if isinstance(reference, str) and reference.startswith("$"):
            skin_val, uuid, d = self.retrieve_texture(reference, **kwargs)
            if d:
                yield d
            node = replace(node, value=AstNbtCompound.from_value({
                "id": uuid,
                "properties": [
                    {
                        "name": "textures",
                        "value": skin_val,
                    }
                ]
            }))
        return node


    def retrieve_texture(self, skin_name: str, **kwargs: Any) -> tuple[str, list[int], Diagnostic|None]:
        skin_name = skin_name.lstrip("$")
        if ":" not in skin_name:
            skin_name = f"{self.ctx.project_id}:{skin_name}"
        self.used_textures.append(skin_name)
        cached_data = self.skin_cache["skins"].get(skin_name, {"hash": None, "parent_module": self.ctx.project_id})

        if cached_data["parent_module"] == self.ctx.project_id: # if the skin belongs to another module, just trust the cache to be right. The skin.png file isn't available to check
            try:
                skin_file: Skin = self.ctx.data[Skin][skin_name]
            except KeyError:
                d = Diagnostic("error", f"Unknown skin \'{skin_name}\'",
                                filename=kwargs.get("filename"),
                                file=kwargs.get("file")
                                )
                return MISSING_TEXTURE_SKIN, [0,0,0,0], d
            else:
                skin_hash = hashlib.sha1(skin_file.image.tobytes()).hexdigest() #type: ignore

                if skin_hash != cached_data["hash"]:
                    # the image file contents have changed - upload the new image
                    value, uuid = self.mineskin_upload(skin_file, f"{skin_name.split(':')[-1]}.png")
                    if value is None or uuid is None:
                        return MISSING_TEXTURE_SKIN, [0,0,0,0], None # skin upload failed, don't cache the result and return missing texture
                    self.skin_cache["skins"][skin_name] = {
                        "uuid": uuid,
                        "value": value,
                        "hash": skin_hash,
                        "parent_module": self.ctx.project_id
                    }
                    return value, uuid, None
        return cached_data["value"], cached_data["uuid"], None

    def mineskin_upload(self, skin: Skin, filename: str) -> tuple[str|None, list[int]|None]:
        logger = parent_logger.getChild(f"mineskin_upload.{self.ctx.project_id}")
        if os.getenv("GITHUB_ACTIONS"):
            logger.error(f"Failed to upload {filename}. Github Actions cannot upload skins via the mineskin api")
            sys.exit(1) # quit the build and mark the github action as failed

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

        # split hex uuid into 4 ints
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
    
    def cache_nonnative_references(self):
        """Adds any skin references from another module into skin_cache.json, so changes can trigger patch increments"""
        if (nonnative_refs := set(self.used_textures) - set(self.ctx.data[Skin])):
            self.skin_cache["nonnative_references"][self.ctx.project_id] = sorted(nonnative_refs)
        else:
            self.skin_cache["nonnative_references"].pop(self.ctx.project_id, None)

    def output_skin_cache(self):
        JsonFile(self.skin_cache).dump(origin="", path="gm4/skin_cache.json")

class MineskinAuthManager():
    """A process for managing mineskin access credentials, prompting the user if needed"""
    def __init__(self, ctx: Context):
        token_cache = ctx.cache.get("mineskin").json.get("token") # type: ignore , cache.get ensures cache exists

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
