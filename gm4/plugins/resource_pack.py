from beet import Context, PluginOptions, configurable, JsonFile, ListOption, Model
from typing import Union, Optional, Any
from beet.core.utils import extra_field
from pydantic import BaseModel, Extra
from functools import partial

CUSTOM_MODEL_PREFIX = 3420000

class ModelData(BaseModel):
    item: ListOption[str]
    reference: Optional[str]
    model: Optional[str]
    broadcast: Optional[list['ModelData']] = []

    def collapse_broadcast(self) -> list['ModelData']:
        """Collapses inherited config through the broadcast field into a list of single ModelData's"""
        ret_list: list[ModelData] = []
        for child in self.broadcast:
            m = ModelData.parse_obj(self.dict(exclude_unset=True,exclude={"broadcast"}) | child.dict(exclude_unset=True))
            if m.broadcast:
                m = m.collapse_broadcast()
                ret_list.extend(m)
            else:
                ret_list.append(m)
        if not self.broadcast:
            ret_list.append(self)
        return ret_list

class ModelDataOptions(PluginOptions, extra=Extra.ignore):
    model_data: list[ModelData] = []

    def process_inheritance(self):
        """Mutates its own data, collapsing any broadcast fields"""
        new_data = []
        for model in self.model_data:
            new_data.extend(model.collapse_broadcast())
        self.model_data = new_data


@configurable(name="gm4", validator=ModelDataOptions)
def generate_model_overrides(ctx: Context, opts: ModelDataOptions):
    """Generates item model overrides in the 'minecraft' namespace, adding predicates for CustomModelData"""

    registry = JsonFile(source_path="gm4/modeldata_registry.json").data

    opts.process_inheritance()
    
    # sort models by item id
    for item_id in {i for m in opts.model_data for i in m.item.entries()}:
        models = list(filter(lambda m: item_id in m.item.entries(), opts.model_data))

        model_override = {
            "parent": "minecraft:item/generated",
            "textures": {
                "layer0": f"minecraft:item/{item_id}" # TODO block models don't get this?
            },
            "overrides": []
        }
        overrides = model_override["overrides"]

        filter_func = partial(_filter_by_reference, models=models, namespace=ctx.project_id)
        custom_model_data = dict(filter(filter_func, registry["items"][item_id].items())) # TODO error logging
        
        for model in models:
            # if model.model # TODO this check
            if ":" not in (ref:=model.reference):
                ref = f"{ctx.project_id}:{ref}"
            overrides.append({
                "predicate": {
                    "custom_model_data": CUSTOM_MODEL_PREFIX+custom_model_data[ref]
                },
                "model": model.model
            })

        ctx.assets.models[f"minecraft:item/{item_id}"] = Model(model_override) # TODO skipped-values spacing, on RP output after merge :)

def _filter_by_reference(registry_itemview: tuple[str, int], models: list[ModelData], namespace: str) -> bool:
    """a filter checking if an entriy of the cmd registry matches a given list of models"""
    registry_ref, index = registry_itemview
    models_references = [m.reference for m in models]
    
    for config_ref in models_references:
        if ":" not in config_ref:
            config_ref = f"{namespace}:{config_ref}"
        
        if registry_ref == config_ref:
            return True
    return False


        