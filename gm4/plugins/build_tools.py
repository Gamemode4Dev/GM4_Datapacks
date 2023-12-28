import datetime
import hashlib
import inspect
import json
import logging
import os
import types
from io import BytesIO
from pathlib import Path
from gzip import GzipFile

from beet import Connection, Context, Pipeline
from nbtlib.contrib.minecraft import StructureFile, StructureFileData # type: ignore ; no stub file
from beet.library.base import _dump_files
from repro_zipfile import ReproducibleZipFile # type: ignore ; no stub file

from gm4.plugins.manifest import (
    ManifestCacheModel,
    ManifestFileModel,
    ManifestModuleModel,
)
from gm4.utils import Version

RETRIEVE_PROJECTS = 0

def test(ctx: Context):
    pp = ctx.inject(Pipeline)
    for p in pp.tasks:
        print(p)
        if isinstance(p.plugin, types.FunctionType):
            print(inspect.getfile(p.plugin))

    # print("plugins set")
    # for p in pp.plugins:
    #     print(inspect.getfile(p))

    print(pp.ctx)

def store_project(ctx: Context):
    print(f"storing project {ctx.project_id}")
    yield
    with ctx.worker(bridge) as channel:
        channel.send(ctx)

def retrieve_projects(ctx: Context): # TODO name?
    print("retrieving projects!")
    plugins = ctx.meta.get("plugins",[])
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_PROJECTS)
    for stored_contexts in channel:
        for c in stored_contexts:
            c.require(*plugins)
            c.inject(Pipeline).run() # manually trigger exit phases of plugins, as the stored context c has finished its earlier pipeline

def bridge(connection: Connection[Context|int, list[Context]]): # TODO notation on packet header
    # incoming types `Context|int` and outgoing types `Context`
    context_storage: list[Context] = []

    for client in connection: # iterable is kept open throughout the life of the build
        # each `channel.send` causes a new element immediately processed here
        for request in client:
            # request is the actual payload - here the Context object
            if isinstance(request, Context):
                context_storage.append(request)
            if request == RETRIEVE_PROJECTS:
                client.send(context_storage)
                context_storage = []

def update_patch(ctx: Context):
    """Checks the datapack files for changes from last build, and increments patch number"""
    yield
    version = os.getenv("VERSION", "1.20")
    release_dir = Path('release') / version
    manifest_file = release_dir / "meta.json"
    logger = logging.getLogger(__name__)

    print(f"running on {ctx.project_id}")

    # load current manifest from cache
    this_manifest = ManifestCacheModel.parse_obj(ctx.cache["gm4_manifest"].json)
    pack = (this_manifest.modules | {l.id:l for l in this_manifest.libraries.values()})[ctx.project_id]

    # attempt to load prior meta.json manifest
    if manifest_file.exists():
        last_manifest = ManifestFileModel.parse_obj(json.loads(manifest_file.read_text()))
        released_modules: dict[str, ManifestModuleModel] = {m.id:m for m in last_manifest.modules if m.version}|{l.id:l for l in last_manifest.libraries.values()}
    else:
        logger.debug("No existing meta.json manifest file was located")
        # last_commit = None
        released_modules = {}

    # determine this modules status
    released = released_modules.get(ctx.project_id, None)
    last_ver = Version(released.version) if released else Version("0.0.0")
    this_ver = Version(ctx.project_version)
    publish_date = released.publish_date if released else None
    pack.publish_date = publish_date or datetime.datetime.now().date().isoformat()
    old_hash = released.hash if released else "" # FIXME no prior hash problem?

    # watch for output file changes
    fileobj = BytesIO()
    with ReproducibleZipFile(fileobj, mode='w') as zf:
        _dump_files(zf, sorted(ctx.data.list_files())) # write datapack to temporary memory
            # beet's default dump depends on file load order, which is nondeterministic
            # here we recreate the ctx.data.dump(zf) behavior but by sorting the files first

        # with open("log.txt", "wt") as f: # TODO remove debug code
        #     f.writelines([str(s)+"\n" for s in zf.infolist()])

    new_hash = hashlib.sha1(fileobj.getvalue()).hexdigest()
    pack.hash = new_hash

    # first release of a module
    if not released:
        pack.version = pack.version.replace("X", "0")
        logger.debug(f"First release of {ctx.project_id}")

    # otherwise check for changes
    else:
        if (this_ver != last_ver.replace(patch=None)) or (new_hash != old_hash): # changes were made, bump the patch
            if this_ver.minor > last_ver.minor or this_ver.major > last_ver.major: # type: ignore
                this_ver.patch = 0
                logger.info(f"Feature update for {ctx.project_id}, setting version to {this_ver}")
            else:
                this_ver.patch = last_ver.patch + 1 # type: ignore
                logger.info(f"Updating {ctx.project_id} patch to {this_ver.patch}") # type: ignore

            pack.version = str(this_ver)

        else: # no changes, keep the patch
             pack.version = released.version

    ctx.cache["gm4_manifest"].json = this_manifest.dict()


def repro_structure_to_bytes(content: StructureFileData) -> bytes:
    """a modified Structure.to_bytes from beet, which ensures the GZip does not add
       the current time.time to the nbt file header. 
       Used for deterministic pack builds and auto-patch detection"""
    dst = BytesIO()
    with GzipFile(fileobj=dst, mode="wb", mtime=0) as fileobj:
        StructureFile(content).write(fileobj) # type: ignore ; nbtlib has no type annotations
    return dst.getvalue()