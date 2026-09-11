from beet import Context, TagFile, NamespaceFileScope
from typing import ClassVar


def beet_default(ctx: Context):
    ctx.data.extend_namespace += [WorldgenCarverTag]


class WorldgenCarverTag(TagFile):
    """Class representing a worldgen carver tag."""

    scope: ClassVar[NamespaceFileScope] = ("tags","worldgen","carver")
    extension: ClassVar[str] = ".json"
