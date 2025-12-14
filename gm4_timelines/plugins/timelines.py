from beet import Context, JsonFile, NamespaceFileScope
from typing import ClassVar


def beet_default(ctx: Context):
    ctx.data.extend_namespace += [Timeline]

class Timeline(JsonFile):
    scope: ClassVar[NamespaceFileScope] = ("timeline",)
    extension: ClassVar[str] = ".json"
