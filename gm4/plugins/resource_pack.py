from beet import Context, PluginOptions, configurable, JsonFile, ListOption
from typing import Union, Optional, Any
from beet.core.utils import extra_field
from pydantic import BaseModel, Extra

class ModelData(BaseModel):
    item: Optional[str]
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
    print(opts.model_data)
    opts.process_inheritance()
    print(opts.model_data)

    registry = JsonFile(source_path="gm4/modeldata_registry.json")

    # for ref_id, data in opts.entries:
    #     if isinstance(data, str):
    #         item = data
    #     elif isinstance(data, dict):
    #         item = data["item"] # TODO sub config on each entry of ModelDataOptions
            
        # NOTE hmm actually I would need to assemble per-item lists first? Would it be better to invert the config? Root is item_type and has list of model refs?
