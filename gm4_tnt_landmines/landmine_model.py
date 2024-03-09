from beet import Context, Model, NamespaceProxy
from gm4.plugins.resource_pack import ModelData, TemplateOptions, ItemDisplayModel, ensure_single_model_config

class LandmineTempalte(TemplateOptions):
    name = "tnt_landmines:landmine"
    texture_map = []

    default_transforms = [
        ItemDisplayModel(
            origin=[0.5,0.5,0.5],
            scale=[0.438, 0.438, 0.438],
            translation=[0,0.4,0]
        )
    ]

    @classmethod
    def process(cls, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        model_name = ensure_single_model_config(cls.name, config)
        variant = config.reference.split('/')[-1]
        m = models_container[model_name] = Model({
            "parent": "gm4_tnt_landmines:entity/landmine",
            "textures": {
                "side": f"gm4_tnt_landmines:entity/{variant}_side",
                "top": f"gm4_tnt_landmines:entity/{variant}_top",
                "bottom": f"gm4_tnt_landmines:entity/tnt_landmine_bottom"
            }
        })
        return [m]
    
def beet_default(ctx: Context):
    pass
