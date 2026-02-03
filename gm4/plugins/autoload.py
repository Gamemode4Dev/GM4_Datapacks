from beet import Context

def beet_default(ctx: Context):
    """Loads plugins auto-added to every beet subproject. Configured in pyproject.toml
    Used primarily to load custom-merge-rules that will apply between broadcast packs, at least until a better option is available in beet"""
    ctx.require(
        "beet.contrib.default",
        "gm4.plugins.resource_pack.merge_policy",
        "gm4_metallurgy.shamir_model_template.merge_policy"
    )
