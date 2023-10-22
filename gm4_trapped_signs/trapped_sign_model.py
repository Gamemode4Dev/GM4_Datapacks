from beet import Context, Model, NamespaceProxy
from gm4.plugins.resource_pack import ModelData, TemplateOptions, ensure_single_model_config

class TrappedSignTemplate(TemplateOptions):
    """Generates the models for trapped signs, putting a shared overlay atop the vanilla sign texture"""
    name = "trapped_signs:sign_overlay"

    @classmethod
    def process(cls, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        model_name = ensure_single_model_config(cls.name, config)
        m = models_container[model_name] = Model({
            "parent": f"minecraft:item/{config.item.entries()[0]}",
            "textures": {
                # "layer0": inherited from the vanilla model
                "layer1": "gm4_trapped_signs:item/trapped_sign_overlay"
            }
        })
        return [m]
    
def beet_default(ctx: Context):
    # in the future, the models and loot tables should be generated automatically from all the vanilla sign types
    pass
