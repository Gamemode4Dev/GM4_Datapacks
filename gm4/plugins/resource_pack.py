from beet import Context, PluginOptions, configurable, JsonFile, ListOption, Model
from typing import Union, Optional, Any
from beet.core.utils import extra_field
from pydantic import BaseModel, Extra
from functools import partial, cached_property
from beet.contrib.vanilla import Vanilla
from gm4.utils import add_namespace
import logging

CUSTOM_MODEL_PREFIX = 3420000

parent_logger = logging.getLogger("gm4.resource_pack")

class ModelData(BaseModel):
    item: ListOption[str]
    reference: Optional[str]
    model: Optional[str|list[dict[str,Any]]]
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

    def process_inheritance(self) -> 'ModelDataOptions':
        """Collapses and returns any broadcast fields in new ModelDataOptions"""
        new_data = []
        for model in self.model_data:
            new_data.extend(model.collapse_broadcast())
        return ModelDataOptions(model_data=new_data)

def update_modeldata_registry(ctx: Context): # TEMP redirect
    o = ctx.inject(GM4ResourcePack)
    o.update_modeldata_registry()
def generate_model_overrides(ctx: Context): # TEMP redirect
    o = ctx.inject(GM4ResourcePack)
    o.generate_model_overrides()

def beet_default():
    # TEMP record of process
    # mecha register
    # yield
    # save registry out / cache for next step in build
    pass

class GM4ResourcePack():
    """Service Object handling CustomModelData and generated item models"""

    def __init__(self, ctx: Context):
        self.ctx = ctx
        self.registry_file = JsonFile(source_path="gm4/modeldata_registry.json")

    @cached_property
    def opts(self) -> ModelDataOptions:
        # load and process config when it's first accessed. 
        return self.ctx.validate("gm4", validator=ModelDataOptions).process_inheritance()

    def update_modeldata_registry(self):
        """Updates shared modeldata_registry.json with entries from the beet.yaml"""
        logger = parent_logger.getChild(f"update_modeldata_registry.{self.ctx.project_id}")
        item_registry: dict[str, dict[str, int]] = self.registry_file.data["items"]

        # add new references and assign values
        for m in self.opts.model_data:
            ref = add_namespace(m.reference, self.ctx.project_id)
            i = _retrieve_index(ref)
            if i is not None: # existing index, is it available to assign to all items
                conflicts = False
                for item_id in m.item.entries():
                    reg = item_registry[item_id]
                    used_idxs = {k: reg[k] for k in reg.keys() - {ref}}.values()
                    if i in used_idxs:
                        logger.warning(f"Failed to share existing CustomModelData for '{ref}' to '{item_id}'. A new value will be assigned for this reference; existing items may lose their texture!")
                        conflicts = True
            if i is None or conflicts: # no existing index, or existing isn't available; get a new one
                i = _retrieve_new_index(m.item.entries(), self.ctx.project_id)
            for item_id in m.item.entries():
                if ref not in item_registry.setdefault(item_id, {}):
                    item_registry[item_id][ref] = i
                    logger.info(f"Issuing new CustomModelData for '{ref}': {i}") # FIXME issues with adding a new item to existing registry

        # remove unused references
            # NOTE deleting modeldata is really only supported for development cycles. Once published, a cmd value should be permanent.
            # Thus, a reference will only be removed if it is no longer present on *any* item in the beet.yaml
        all_refs = {v for r in self.opts.model_data if (v:=add_namespace(r.reference, self.ctx.project_id)).startswith(self.ctx.project_id)}
        for item_id, reg in item_registry.items():
            for ref in list(reg.keys()):
                if ref.startswith(self.ctx.project_id) and ref not in all_refs:
                    logger.info(f"Removing undefined CustomModelData from registry: '{ref}'")
                    del reg[ref]
            #FIXME clear references from items no longer configured too

        # # sort registriy alphabetically and numerically # TODO this as a cleanup step?
        # self.registry_file.data["items"] = dict(sorted(registry_file.data["items"].items()))
        # for item_id, ref_map in item_registry.items():
        #     item_registry[item_id] = dict(sorted(ref_map.items(), key=lambda e: e[1]))

        # self.registry_file.dump(origin="", path="gm4/modeldata_registry.json") # TODO cache this file somehow? Part of RP service exit?


    def generate_model_overrides(self):
        """Generates item model overrides in the 'minecraft' namespace, adding predicates for CustomModelData"""
        
        registry = self.registry_file.data # FIXME
        vanilla = self.ctx.inject(Vanilla)
        vanilla_models_jar = vanilla.mount("assets/minecraft/models/item")

       
        # sort models by item id
        for item_id in {i for m in self.opts.model_data for i in m.item.entries()}:
            models = list(filter(lambda m: item_id in m.item.entries(), self.opts.model_data))
            print(f"{item_id} models: {models}")

            model_override = (v:=vanilla_models_jar.assets.models[f"minecraft:item/{item_id}"].data) | ({} if v.get("overrides") else {"overrides": []})
            overrides = model_override["overrides"]
            print(f"{item_id} overrides start: {overrides}")

            filter_func = partial(_filter_by_reference, models=models, namespace=self.ctx.project_id)
            custom_model_data = dict(filter(filter_func, registry["items"][item_id].items())) # TODO error logging
            
            for model in models:
                # setup overrides to add CMD to
                merge_overrides = [] # FIXME this shouldnt need to be initialized
                if isinstance(model.model, list): # manual predicate merging specified
                    merge_overrides = model.model # FIXME check branch unnecessary
                elif isinstance(model.model, str): 
                    merge_overrides = overrides.copy() # get vanilla overrides # FIXME deepcopy?
                if len(merge_overrides) == 0:
                    merge_overrides.append({}) # add an empty predicate to add CMD onto

                ref = add_namespace(model.reference, self.ctx.project_id)

                for pred in merge_overrides:
                    overrides.append({
                        "predicate": {
                            "custom_model_data": CUSTOM_MODEL_PREFIX+custom_model_data[ref]
                        } | pred.get("predicate", {}),
                        "model": ref #model.model # FIXME points to generated model file?
                    })
            print(overrides)
            self.ctx.assets.models[f"minecraft:item/{item_id}"] = Model(model_override) # TODO skipped-values spacing, on RP output after merge :)

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

def _retrieve_new_index(item_ids: list[str], project_id: str) -> int:
    """finds the next available CMD value for the given model"""
    registry = JsonFile(source_path="gm4/modeldata_registry.json").data # TODO this might be a service object member 
    l, u = registry["allocations"].get(project_id, (0,99)) # FIXME what happens when the default allocation fills up
    available_indices = set(range(l, u+1))

    for item_id in item_ids:
        used_values = set(registry["items"].get(item_id, {}).values())
        available_indices -= used_values

    if not available_indices:
        parent_logger.warning("No Valid CMD is open for assignment!") # FIXME this warn
        return None
    return min(available_indices)

def _retrieve_index(reference: str) -> int:
    """retrieves the CMD value for the given reference""" # TODO move to service objecT? rename this function?
    registry = JsonFile(source_path="gm4/modeldata_registry.json").data

    for item_id, reg in registry["items"].items():
        if reference in reg:
            return reg[reference]
    return None # TODO this becomes an exception? KeyError
