from beet import Context, ListOption
from beet.contrib.rename_files import rename_files
from beet.contrib.find_replace import find_replace


def beet_default(ctx: Context):
    """
    Refactors an external library to use GM4 prefixing.
    Deletes `#minecraft:load` and `#minecraft:tick` function tags
    from external library to allow for proper lantern load versioning.
    """

    try:
        if "prefix" in ctx.meta["gm4"]["refactor_external"]:
            to_prefix: ListOption[str] = ListOption(
                __root__=ctx.meta["gm4"]["refactor_external"]["prefix"]
            )
            for namespace in to_prefix.entries():
                prefixed_namespace = f"gm4_{namespace}"
                ctx.require(
                    rename_files(
                        data_pack={
                            "match": "*",
                            "find": f"^{namespace}:([a-z_/]+)",
                            "replace": f"{prefixed_namespace}:\\1",
                        }
                    )
                )
                ctx.require(
                    find_replace(
                        data_pack={"match": "*"},
                        substitute={
                            "find": f"\\b{namespace}",
                            "replace": f"{prefixed_namespace}",
                        },
                    )
                )
    except KeyError:
        pass

    try:
        del ctx.data.function_tags["minecraft:load"]
    except KeyError:
        pass

    try:
        del ctx.data.function_tags["minecraft:tick"]
    except KeyError:
        pass
