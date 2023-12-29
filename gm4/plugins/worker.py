from beet import Connection, Context, Pipeline, Font
from nbtlib.contrib.minecraft import StructureFile, StructureFileData # type: ignore ; no stub file

RETRIEVE_PROJECTS = 0

def store_project(ctx: Context):
    """Stores the current context object in a beet worker"""
    with ctx.worker(bridge) as channel:
        channel.send(ctx)

def retrieve_and_run(ctx: Context):
    """Retrieves contexts stored by the worker and runs the specified plugins on each one"""
    plugins = ctx.meta.get("plugins",[])
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_PROJECTS)
    for stored_contexts in channel:
        for c in stored_contexts:
            c.require(*plugins)
            c.inject(Pipeline).run() # manually trigger exit phases of plugins, as the stored context c has finished its earlier pipeline

def retrieve_and_merge(ctx: Context):
    """Retrieves stored contexts and merges their packs into the current/parent context"""
    with ctx.worker(bridge) as channel:
        channel.send(RETRIEVE_PROJECTS)
    for stored_contexts in channel:
        for c in stored_contexts:
            
            #FIXME build hangs when fonts are merged from one ResourcePack to another... why is unknown
            # this is a manual work around to merge the font files without causing the strange hang
            for f, font in c.assets.fonts.items():
                ctx.generate(f, merge=font)
            c.assets.fonts.clear()

            ctx.data.merge(c.data)
            ctx.assets.merge(c.assets)

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