from beet import NamespaceProxy, Model, Context
from gm4.plugins.resource_pack import TemplateOptions, ModelData, ItemDisplayModel

class OreDisplayTemplate(TemplateOptions):
    """setup a model template for the smeltable ores displayed by smeltries"""
    name = "smelteries:ore_display"
    texture_map = ["top", "side"]
    
    default_transforms = [
        ItemDisplayModel(
            origin=[0.5, 0.5, 0.5],
            scale=[0.624, 0.624, 0.624],
            translation=[0, 0.19, 0]
        )
    ]

    @staticmethod
    def process(config: ModelData, models_container: NamespaceProxy[Model]):
        reference = config.reference.split('/')[-1]
        return Model({
            "parent": "gm4_smelteries:block/ore_display",
            "textures":{
                "top": f"gm4_smelteries:block/ore_display/{reference}_top",
                "side": f"gm4_smelteries:block/ore_display/{reference}_side",
            }
        })

def beet_default(ctx: Context):
    pass
