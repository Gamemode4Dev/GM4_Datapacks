from beet import Context, Pipeline, Connection
from typing import Optional
import inspect
import types
from dataclasses import dataclass
from gm4.plugins.output import release as release_plugin

RETRIEVE_PROJECTS = 0


def store_project(ctx: Context):
    yield
    with ctx.worker(bridge) as channel:
        channel.send(ctx)

def retrieve_projects(ctx: Context): # TODO name?
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
