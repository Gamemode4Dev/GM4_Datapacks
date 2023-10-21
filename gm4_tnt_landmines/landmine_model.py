from beet import Context, Model, NamespaceProxy
from gm4.plugins.resource_pack import ModelData, TemplateOptions, ItemDisplayModel

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

    @staticmethod
    def process(config: ModelData, models_container: NamespaceProxy[Model]) -> Model:
        variant = config.reference.split('/')[-1]
        return Model({
            "parent": "gm4_tnt_landmines:entity/landmine",
            "textures": {
                "side": f"gm4_tnt_landmines:entity/{variant}_side",
                "top": f"gm4_tnt_landmines:entity/{variant}_top",
                "bottom": f"gm4_tnt_landmines:entity/tnt_landmine_bottom"
            }
        })
    
def beet_default(ctx: Context):
    pass
