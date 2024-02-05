from beet import Context, TextFile
from typing import ClassVar, Tuple


def load_tests(ctx: Context):
    ctx.data.extend_namespace += [TestFile]


class TestFile(TextFile):
    """Class representing an test function."""

    scope: ClassVar[Tuple[str, ...]] = ("tests",)
    extension: ClassVar[str] = ".mcfunction"


def strip_tests(ctx: Context):
    for structure in ctx.data.structures.match("*:test_*"):
        del ctx.data.structures[structure]
