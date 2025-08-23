from beet import NamespaceProxy, Model, Context
from gm4.plugins.resource_pack import TemplateOptions, ModelData, ItemDisplayModel, ensure_single_model_config, ContainerGuiOptions, CenteredContainerGui

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

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]):
        model_name = ensure_single_model_config(self.name, config)
        reference = config.reference.split('/')[-1]
        m = models_container[model_name] = Model({
            "parent": "gm4_smelteries:block/ore_display",
            "textures":{
                "top": f"gm4_smelteries:block/ore_display/{reference}_top",
                "side": f"gm4_smelteries:block/ore_display/{reference}_side",
            }
        })
        return [m]
    
class FurnaceContainerGui(CenteredContainerGui, ContainerGuiOptions):
    container = "furnace"

def beet_default(ctx: Context):
    pass
