from beet import Context

def beet_default(ctx: Context):
    """Loads plugins auto-added to every beet subproject. Configured in pyproject.toml
    Used primarily to load custom-merge-rules that will apply between broadcast packs, at least until a better option is available in beet"""
    ctx.meta["model_merging"] = {
        "predicate_order": ["custom_model_data"]  # set default model_merging config for these broadcast-created subprojects
    }
    ctx.require(
        "beet.contrib.default",
        "beet.contrib.model_merging",
        "gm4.plugins.resource_pack.merge_policy",
        "gm4_metallurgy.shamir_model_template.merge_policy"
    )
