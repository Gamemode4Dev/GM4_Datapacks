from beet import Context, Project, ProjectBuilder, PackConfig
from beet.toolchain.config import load_config

def beet_default(ctx: Context):
    pass

def dev_test_1(ctx: Context):
    print(f"beet cache restored as: {list(ctx.cache.keys())}")

    print(f"gm4_manifest is :{ctx.cache["gm4_manifest"]}")

def my_load_config(ctx: Context):
    """Loads relavent fields from each module's beet.yaml, without inheriting the pipeline and running plugins"""

    config = load_config(ctx.directory/"beet.yaml")

    config.require = []
    config.pipeline = ctx.meta.get("plugins", [])
    config.data_pack = PackConfig()
    config.resource_pack = PackConfig()

    print(config)

    # run the new list of plugins from beet-publish.yaml
    ctx.require(
        ProjectBuilder(
            Project(
                config,
                resolved_cache=ctx.cache
            )
        )
    )
