from beet import Connection, Context, Pipeline, ResourcePack, DataPack
from typing import Any

RETRIEVE_ALL_PROJECTS = 0
RETRIEVE_LAST_PROJECT = 1
ProjectPacket = tuple[ResourcePack, DataPack, dict[str, Any]]

def store_project(ctx: Context):
    """Stores the current project object in a beet worker"""
    with ctx.worker(bridge) as channel:
        rp, dp = ctx.packs
        ctx_params = {k:getattr(ctx, k) for k in ("project_id",
                                                  "project_name",
                                                  "project_description",
                                                  "project_author",
                                                  "project_version",
                                                  "project_root",
                                                  "minecraft_version",
                                                  "directory",
                                                  "output_directory",
                                                  "meta",
                                                  "cache",
                                                  "worker",
                                                  "template")}

        channel.send((rp, dp, ctx_params))

def freeze_last_stored(ctx: Context):
    """'Freezes' the state of the last stored project by making it a shallow copy, allowing the original to be cleared"""
    yield # wait for exit phase
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_LAST_PROJECT)
    for last_project in channel:
        rp, dp, params = last_project[0] # only one project is passed in list
        frozen_rp = rp.copy(shallow=True)
        frozen_dp = dp.copy(shallow=True)

        # send back the frozen packs
        with ctx.worker(bridge) as channel:
            channel.send((frozen_rp, frozen_dp, params))

def clear_on_exit(ctx: Context):
    """Clears the packs on the exit phase - prevents faulty race condition merges into the parent subproject in a pipeline"""
    yield
    ctx.data.clear()
    ctx.assets.clear()

def retrieve_and_run(ctx: Context):
    """Retrieves projects stored by the worker, reconstructs a Context() and runs the specified plugins on each one"""
    plugins = ctx.meta.get("plugins",[])
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_ALL_PROJECTS)
    for stored_project in channel:
        for rp, dp, ctx_params in stored_project:
            c = Context(**ctx_params, assets=rp, data=dp)
            c.activate()
            c.require(*plugins)
            c.inject(Pipeline).run() # manually run plugin's exit phases as this context is "headless"

def retrieve_and_merge(ctx: Context):
    """Retrieves stored contexts and merges their packs into the current/parent context"""
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_ALL_PROJECTS)
    for stored_project in channel:
        for rp, dp, _ in stored_project:
            
            #NOTE build hangs when fonts are merged from one ResourcePack to another... why is unknown
            # this is a manual work around to merge the font files without causing the strange hang
            for f, font in rp.fonts.items():
                ctx.generate(f, merge=font)
            rp.fonts.clear()

            # clear mcmeta entries to the current context can properly make its own
            del dp.mcmeta
            del rp.mcmeta

            ctx.data.merge(dp)
            ctx.assets.merge(rp)

def bridge(connection: Connection[ProjectPacket|int, list[ProjectPacket]]):
    # incoming types `ProjectPacket|int` and outgoing types `list[ProjectPacket]`
    project_storage: list[tuple[ResourcePack, DataPack, dict[str, Any]]] = []

    for client in connection: # iterable is kept open throughout the life of the build
        # each `channel.send` causes a new element immediately processed here
        for request in client:
            # request is the actual payload - here the Context object
            if isinstance(request, tuple):
                project_storage.append(request)
            if request == RETRIEVE_ALL_PROJECTS:
                client.send(project_storage)
                project_storage = []
            if request == RETRIEVE_LAST_PROJECT:
                client.send([project_storage.pop(-1)])
