import base64
import hashlib
import json
import logging
import os
import sys
import time
from dataclasses import replace
from io import BytesIO
from typing import Any, Callable, ClassVar, Generator

import requests
from beet import Context, FileDeserialize, JsonFile, PngFile, TextFile
from mecha import CompilationUnit, Diagnostic, Mecha, MutatingReducer, rule
from mecha.ast import (
    AstChildren,
    AstCommand,
    AstNbtCompound,
    AstNbtCompoundEntry,
    AstNbtPath,
    AstNbtPathKey,
    AstResourceLocation,
)
from nbtlib import IntArray # type: ignore
from PIL.Image import Image
from tokenstream import set_location

from gm4.utils import nested_get

parent_logger = logging.getLogger("gm4.player_heads")

USER_AGENT = "Gamemode4Dev/GM4_Datapacks/player_head_management (gamemode4official@gmail.com)"
MISSING_TEXTURE_SKIN = "eyJ0ZXh0dXJlcyIgOiB7ICJTS0lOIiA6IHsgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kYWUyOTA0YTI4NmI5NTNmYWI4ZWNlNTFkNjJiZmNjYjMyY2IwMjc0OGY0NjdjMDBiYzMxODg1NTk4MDUwNThiIn19fQ=="

def beet_default(ctx: Context):
    ctx.data.extend_namespace.append(Skin) # register new filetype to datapack
    tf = ctx.inject(SkinNbtTransformer)
    ctx.inject(Mecha).transform.extend(tf) # register new ruleset to mecha

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
    

class SkinNbtTransformer(MutatingReducer):
    """Reducer class defining custom mecha parsing rules for skin texture data, and storing needed data for those operations"""
    def __init__(self, ctx: Context):
        self.ctx: Context = ctx
        self.skin_cache = JsonFile(source_path="gm4/skin_cache.json").data
        self.used_textures: list[str] = []
        super().__init__()

    @rule(AstNbtCompoundEntry)
    def skullowner_substitutions(self, node: AstNbtCompoundEntry, **kwargs: Any) -> Generator[Diagnostic, None, AstNbtCompoundEntry]:
        if node.key.value == "SkullOwner":
            match node.value.evaluate():
                case val if "$" in val:
                    skin_val, uuid, d = self.retrieve_texture(val, **kwargs)
                    if d:
                        yield d
                    node = replace(node, value=AstNbtCompound.from_value({
                        "Id": IntArray(uuid),
                        "Properties": {
                            "textures":[{
                                "Value": skin_val
                            }]
                        }
                    }))
                case {"Value": str(val), **rest} if "$" in val:
                    skin_val, uuid, d = self.retrieve_texture(val, **kwargs)
                    if d:
                        yield d
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=rest.get("Name")) else {}) |
                        {"Id": IntArray(uuid),
                         "Properties": {
                            "textures":[
                                {"Value": skin_val} |
                                ({"Signature": s} if (s:=rest.get("Signature")) else {})]
                            }
                        }
                    ))
                case {"Properties": {"textures": [{"Value": str(val), **tex_rest}]}, **root_rest} if "$" in val:
                    skin_val, uuid, d = self.retrieve_texture(val, **kwargs)
                    if d:
                        yield d
                    node = replace(node, value=AstNbtCompound.from_value(
                        ({"Name": n} if (n:=root_rest.get("Name")) else {}) |
                        {"Id": IntArray(uuid),
                         "Properties": {
                            "textures":[
                                {"Value": skin_val} | 
                                ({"Signature": s} if (s:=tex_rest.get("Signature")) else {})]
                            }
                        }
                    ))
                case _:
                    if "$" in node.value.evaluate().snbt():
                        yield Diagnostic("warn", f"Unhandled SkullOwner substitution. Format failed to match known schemas.", 
                                            filename=kwargs.get("filename"), file=kwargs.get("file"))
        return node
    
    @rule(AstCommand, identifier="data:modify:storage:target:targetPath:append:value:value")
    def lib_player_heads_skullowner_subs(self, node: AstCommand) -> Generator[Diagnostic, None, AstCommand]:
        """Captures skin texture data in lib_player_heads setup"""
        ast_storage, ast_storage_path, ast_nbt = node.arguments
        if isinstance(ast_storage, AstResourceLocation) and isinstance(ast_storage_path, AstNbtPath) and isinstance(ast_nbt, AstNbtCompound) and isinstance(path_key:=ast_storage_path.components[0], AstNbtPathKey):
            if ast_storage.get_value() == "gm4_player_heads:register" and path_key.value == "heads":
                nbt: dict[str, Any] = ast_nbt.evaluate()
                match nbt:
                    case {"value": str(value)} if "$" in value:
                        skin_val, _, d = self.retrieve_texture(value)
                        if d:
                            erroring_subnode = next(i for i in ast_nbt.entries if i.key.value == "value")
                            yield set_location(d, erroring_subnode)
                        node = replace(node, arguments=AstChildren((ast_storage, ast_storage_path, AstNbtCompound.from_value(nbt|{"value": skin_val}))))
                    case _:
                        pass
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
            self.skin_cache["nonnative_references"][self.ctx.project_id] = list(nonnative_refs)
        else:
            self.skin_cache["nonnative_references"].pop(self.ctx.project_id, None)

    def output_skin_cache(self):
        JsonFile(self.skin_cache).dump(origin="", path="gm4/skin_cache.json")

def process_json_files(ctx: Context):
    """Passes nbt contained in advancements, loot_tables ect.. through the custom Mecha AST rule for appropiate texture replacements"""
    tf = ctx.inject(SkinNbtTransformer)
    mc = ctx.inject(Mecha)

    def transform_snbt(snbt: str, db_entry_key: TextFile) -> str:
        escaped_snbt = snbt.replace("\n", "\\\\n")
            # NOTE snbt in loot-tables reacts weird to \n characters. Both \n and \\\\n produce the same ingame output (\\n). 
            # gm4 only has one case of \n in loot tables, so this replacement forces \n->\\\\n for the mecha parser to read it right.
            # this may need to be altered in the future, but for now this means that \\\\n, while valid in vanilla loot-tables, will not
            # work after being put through the mecha parser
        node = mc.parse(escaped_snbt, type=AstNbtCompound) # parse string to AST
        filename = os.path.relpath(jsonfile.original.source_path, ctx.directory) if jsonfile.original.source_path else None # get relative filepath for Diagnostics
        mc.database.update({db_entry_key: CompilationUnit(source=snbt)}) #type:ignore   # register fake CompilationUnit for Diagnostic printing, using unique string as key instead of the File() object, to support multiple entries from the same file
        return mc.serialize(tf.invoke(node, filename=filename, file=db_entry_key)) # run AST through custom rule, and serialize back to string, passing along data for Diagnostic
    
    for name, jsonfile in [*ctx.data.loot_tables.items(), *ctx.data.item_modifiers.items()]:
        # item modifiers, annoyingly, can have a list as the root, so we wrap in a dict to use nested_get
        contents = {"listroot": jsonfile.data} if type(jsonfile.data) is list else jsonfile.data

        for func_list in nested_get(contents, "functions"):
            f: Callable[[Any], bool] = lambda e: e["function"].removeprefix('minecraft:')=="set_nbt"
            for i, entry in enumerate(filter(f, func_list)):
                key = TextFile(_content=f"{name}_{i}", source_path=jsonfile.source_path)
                entry["tag"] = transform_snbt(entry["tag"], db_entry_key=key)

    for name, jsonfile in ctx.data.advancements.items():
        for i, entry in enumerate(nested_get(jsonfile.data, "icon")):
            key = TextFile(_content=f"{name}_{i}", source_path=jsonfile.source_path)
            entry["nbt"] = transform_snbt(entry["nbt"], db_entry_key=key)

    # send any raised diagnostic errors to Mecha for reporting
    mc.diagnostics.extend(tf.diagnostics)


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
