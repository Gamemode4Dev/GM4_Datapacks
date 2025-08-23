from beet import Model, NamespaceProxy, Context
from gm4.plugins.resource_pack import ModelData, TemplateOptions
from gm4.utils import MapOption

def beet_default(ctx: Context):
    pass

class PneumaTemplate(TemplateOptions):
    """model template to generate the models for shards and essences"""
    name = "pneuma"

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]):
        pneuma = config.reference.split("/")[-1] # eg agile, anchoring ect...
        shard = models_container[f"gm4_orb_of_ankou:item/shards/{pneuma}"] = Model({
            "parent": "item/generated",
            "textures": {
                "layer0": f"gm4_orb_of_ankou:item/shards/{pneuma}"
            }
        })
        essence = models_container[f"gm4_orb_of_ankou:item/essences/{pneuma}"] = Model({
            "parent": "item/generated",
            "textures": {
                "layer0": f"gm4_orb_of_ankou:item/essences/{pneuma}"
            }
        })
        config.model = MapOption(__root__={
            "flint": f"gm4_orb_of_ankou:item/shards/{pneuma}",
            "black_dye": f"gm4_orb_of_ankou:item/essences/{pneuma}"
        })
        return [shard, essence]
