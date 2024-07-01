from beet import Context, TextFile
from typing import ClassVar, Tuple
from mecha import Mecha


def load_tests(ctx: Context):
    ctx.data.extend_namespace += [TestFile]


class TestFile(TextFile):
    """Class representing an test function."""

    scope: ClassVar[Tuple[str, ...]] = ("test",)
    extension: ClassVar[str] = ".mcfunction"


def strip_tests(ctx: Context):
    for structure in ctx.data.structure.match("*:test_*", "*:test/*"):
        del ctx.data.structure[structure]
    for predicate in ctx.data.predicate.match("*:test_*", "*:test/*"):
        del ctx.data.predicate[predicate]


def skip_mecha_lint(ctx: Context):
    """Disables the mecha linting step. Linting errors will be reported by the main project build"""
    mc = ctx.inject(Mecha)
    mc.steps.remove(mc.lint)
