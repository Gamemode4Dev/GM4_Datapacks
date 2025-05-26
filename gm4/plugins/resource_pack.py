import csv
import glob
import logging
import os
import sys
from copy import deepcopy
from dataclasses import replace
from functools import cache
from fnmatch import fnmatch
from itertools import cycle
from typing import Any, ClassVar, Literal, Optional, Union

import numpy as np
from beet import (
    Cache,
    Context,
    Font,
    ItemModel,
    InvalidOptions,
    JsonFile,
    Language,
    ListOption,
    Model,
    NamespaceProxy,
    PluginOptions,
    YamlFile,
    ResourcePack
)
from beet.contrib.link import LinkManager
from beet.contrib.vanilla import Vanilla, ClientJar
from beet.core.utils import format_validation_error
from mecha import (
    AstChildren,
    AstCommand,
    AstItemComponent,
    AstItemPredicateTestComponent,
    AstJson,
    AstJsonObject,
    AstJsonObjectEntry,
    AstJsonObjectKey,
    AstJsonValue,
    AstNbtCompound,
    AstNbtCompoundEntry,
    AstNbtCompoundKey,
    AstNbtPath,
    AstNbtPathKey,
    AstNbtValue,
    Diagnostic,
    DiagnosticCollection,
    DiagnosticError,
    Mecha,
    MutatingReducer,
    Reducer,
    rule,
)
from nbtlib import String  # type: ignore ; nbtlib missing stubfile
from pydantic.v1 import BaseModel, Extra, Field, ValidationError, validator # type: ignore ; v1 validator behaves strangely with type checking
from pydantic.v1.error_wrappers import ErrorWrapper
from tokenstream import set_location

from gm4.utils import (
    InvokeOnJsonNbt,
    MapOption,
    add_namespace,
    propagate_location,
)

JsonType = dict[str,Any]

CUSTOM_MODEL_PREFIX = 3420000

parent_logger = logging.getLogger("gm4.resource_pack")

#== Pydantic Plugin Config Models ==#
class ModelData(BaseModel):
    """A complete config for a single model"""
    item: ListOption[str]
    reference: str
    model: 'MapOption[str]' = "" # defaults to same value as 'reference'      #type:ignore ; the validator handles the default value
    template: 'str|TemplateOptions' = "custom"
    transforms: Optional[list['TransformOptions']]
    textures: MapOption[str] = [] # defaults to same value as reference         #type:ignore ; the validator handles the default value

    @validator('model', pre=True, always=True) # type: ignore ; v1 validator behaves strangely with type checking
    def default_model(cls, model: Any, values: JsonType) -> dict[str, str]:
        if isinstance(model, str) or (isinstance(model, dict) and "type" in model):
            model = [model] # so we can check len for number of items
        if not model and "reference" in values: # no reference set, default to reference string
            return {item: values["reference"] for item in values['item'].entries()}
        if len(model)!=len(values["item"].entries()) and len(model)>1 and not "type" in model: # a single model name may be broadcast to all items, but otherwise lengths match       # type: ignore ; 'model' inherits list[Unknown] from previous isinstance check
            raise ValidationError([ErrorWrapper(ValueError("length of 'item' and 'model' do not match"), loc=())], model=ModelData)
        if isinstance(model, list): # apply item->model map data
            model = dict(zip(values['item'].entries(), cycle(model))) # type: ignore
        if isinstance(model, dict) and set(model.keys())!=set(values['item'].entries()): # make sure the map keys match the item types       # type: ignore ; model is Unknown type
            raise ValidationError([ErrorWrapper(ValueError("dict keys do not match values in 'item'"), loc=())], model=ModelData)
        return model # model is already a mapped dict, of the same length as item      # type: ignore
    
    @validator('template') # type: ignore ; v1 validator behaves strangely with type checking
    def enforce_custom_with_override_predicates(cls, template: 'str|TemplateOptions', values: JsonType) -> 'TemplateOptions':
        # if isinstance(values.get('model'), list) and template != "custom":
        #     raise ValidationError([ErrorWrapper(ValueError("specifying complex predicates in 'model' is not compatiable with templating. Option must be 'custom'"), loc=())], model=ModelData)
        #     # NOTE I don't believe this is a valid check anymore, but I'll leave it here commented in case it needs to be repaired in the future
        # find and apply proper submodel
        name = template.name if isinstance(template, TemplateOptions) else template
        try:
            submodel = {m.name: m for m in TemplateOptions.__subclasses__()}[name]
            return submodel.parse_obj(template.dict() if isinstance(template, TemplateOptions) else {"name": template})
        except KeyError:
            raise ValidationError([ErrorWrapper(ValueError(f"the specified template '{name}' could not be found"), loc=())], model=ModelData)
    
    @validator('transforms', each_item=True) # type: ignore ; v1 validator behaves strangely with type checking
    def apply_transform_submodel(cls, transform: 'TransformOptions', values: JsonType) -> 'None|TransformOptions':
        # find and apply proper submodel
        try:
            submodel = {m.name: m for m in TransformOptions.__subclasses__()}[transform.name]
            return submodel.parse_obj(transform.dict())
        except KeyError:
            raise ValidationError([ErrorWrapper(ValueError(f"the specified template '{transform.name}' could not be found"), loc=())], model=ModelData)
    
    @validator('textures', pre=True, always=True) # type: ignore ; v1 validator behaves strangely with type checking
    def default_texture(cls, textures: MapOption[str], values: JsonType) -> MapOption[str]:
        empty_list = False
        if textures is None: # type: ignore
            empty_list = True
        elif isinstance(textures, (list,dict)):
            empty_list = len(textures)==0
        elif isinstance(textures, MapOption): # type: ignore
            empty_list = len(textures.entries())==0
        if empty_list and isinstance(v:=values.get("reference"), str):
            return MapOption(__root__=[v])
        return textures

    def add_namespace(self, namespace: str) -> 'ModelData':
        """Returns a new ModelData with the given given namespace applied to any fields"""
        ret_dict = self.dict()
        ret_dict["reference"] = add_namespace(self.reference, namespace)
        ret_model = deepcopy(self.model.entries())
        for i, model_name in enumerate(ret_model):
            ret_model[i] = add_namespace(model_name, namespace) # accessed by index to overwrite original
        ret_dict["model"] = ret_model
        if self.textures:
            if isinstance(self.textures.__root__, list):
                ret_dict["textures"] = [add_namespace(t, namespace) for t in self.textures.entries()]
            else: # isinstance(self.textures.__root__, dict):
                ret_dict["textures"] = {k: add_namespace(v, namespace) for k, v in self.textures.items()}
        ret_dict["template"] = self.template.add_namespace(namespace) # type: ignore ; pydantic validation ensures type is TemplateBase
        return ModelData.parse_obj(ret_dict)
    
class NestedModelData(BaseModel):
    """A potentially incomplete config, allowing for nested inheritance of fields"""
    item: Optional[ListOption[str]]
    reference: Optional[str]
    model: Optional[MapOption[str]] # defalts to reference
    template: Optional['str|TemplateOptions'] = "custom"
    transforms: Optional[list['TransformOptions']]
    textures: Optional[MapOption[str]]
    broadcast: Optional[list['NestedModelData']] = []

    def collapse_broadcast(self) -> list['NestedModelData']:
        """Recursively collapses broadcast fields into a list of NestedModelData"""
        if not self.broadcast:
            return [self]
        ret_list: list[NestedModelData] = []
        for child in self.broadcast:
            m = NestedModelData.parse_obj(self.dict(exclude_unset=True,exclude={"broadcast"}) | child.dict(exclude_unset=True))
            if m.broadcast:
                m = m.collapse_broadcast()
                ret_list.extend(m)
            else:
                ret_list.append(m)
        return ret_list
    
class GuiFont(BaseModel):
    """config for a single container gui using custom fonts"""
    translation: str
    container: 'str|ContainerGuiOptions'
    texture: str

    @validator('container') # type: ignore ; v1 validator behaves strangely with type checking
    def resolve_container(cls, container: 'str|ContainerGuiOptions', values: JsonType) -> 'ContainerGuiOptions':
        container_type = container.container if isinstance(container, ContainerGuiOptions) else container
        try:
            subclass = {m.container: m for m in ContainerGuiOptions.__subclasses__()}[container_type]
            return subclass.parse_obj(container.dict() if isinstance(container, ContainerGuiOptions) else {"name": container})
        except KeyError:
            raise ValidationError([ErrorWrapper(ValueError(f"the specified template '{container_type}' could not be found"), loc=())], model=GuiFont)
        
    def add_namespace(self, namespace: str) -> 'GuiFont':
        """returns a new GuiFont with the texture field namespaced"""
        return GuiFont(
            translation=self.translation,
            container=self.container,
            texture=add_namespace(self.texture, namespace)
        )

class FlatResourcePackOptions(BaseModel):
    """Contains a flat list of complete rp config objects"""
    model_data: list[ModelData]
    gui_fonts: list[GuiFont]

    def add_namespace(self, namespace:str):
        self.model_data=[m.add_namespace(namespace) for m in self.model_data]
        self.gui_fonts=[g.add_namespace(namespace) for g in self.gui_fonts]
    
    def template_mutations(self):
        for m in self.model_data:
            m.template.mutate_config(m) # type: ignore , model validation ensures tempalte is type TemplateOptions()

class ResourcePackOptions(PluginOptions, extra=Extra.ignore):
    model_data: list[NestedModelData] = []
    gui_fonts: list[GuiFont] = []

    def process_inheritance(self) -> FlatResourcePackOptions:
        """Collapses and returns any broadcast fields into processed flat list"""
        ret: list[ModelData] = []
        errors: list[tuple[int, ValidationError]] = []
        for i, model in enumerate(self.model_data):
            try:
                ret.extend([ModelData.parse_obj(m.dict()) for m in model.collapse_broadcast()])
            except ValidationError as exc:
                errors.append((i, exc))

        if errors: # generate traceback for configs missing information
            wrapper_errors: list[ErrorWrapper] = []
            for i, error in errors:
                primary_loc = ("model_data", i)
                s = format_validation_error("gm4", ValidationError(model=ModelData, errors=[
                    ErrorWrapper(ValueError(e['msg']), loc=(*primary_loc,*e['loc']))
                    for e in error.errors()
                ]))
                sub_explainations = "\n\t"+"\n\t".join(s.split("\n"))
                wrapper_errors.append(ErrorWrapper(ValueError("a child inherited incomplete options:"+sub_explainations), loc=primary_loc))
            complete_explaination = format_validation_error("gm4", ValidationError(model=ModelData, errors=wrapper_errors))
            raise InvalidOptions("gm4", complete_explaination)
        
        return FlatResourcePackOptions(model_data=ret, gui_fonts=self.gui_fonts)


class TranslationLinterOptions(PluginOptions, extra=Extra.ignore):
    translation_linter_ignores: list[str] = []

#== Configurable Base Classes ==#
class TemplateOptions(BaseModel, extra=Extra.allow):
    """A pydantic model to extend for configured model templates, which generate model files for common"""
    default_transforms: ClassVar[list['TransformOptions']] = []
    name: ClassVar[str]
    texture_map: ClassVar[list[str]|None] = None

    def __init_subclass__(cls) -> None:
        cls.__config__.extra = Extra.ignore # prevent subclasses from inheriting Extra.allow

    def dict(self, **kwargs: Any) -> JsonType:
        return super().dict(**kwargs) | {"name": self.name} # ensure name class-var is preserved in dict-casting

    def generate_model(self, config: ModelData, models_container: NamespaceProxy[Model]) -> None:
        """Processes the template, and applies transforms"""
        if self.texture_map and config.textures and isinstance(config.textures.__root__, list):
            config = ModelData(**config.dict() | {"textures": dict(zip(self.texture_map, config.textures.entries()))})
        for output_model in self.create_models(config, models_container): # for each returned pointer, add transforms as needed
            if self.default_transforms:
                for transform in self.default_transforms:
                    transform.apply_transform(output_model)
            if config.transforms:
                for transform in config.transforms:
                    transform.apply_transform(output_model)

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        """Overridden to create and mount the model object, and return pointers to them"""
        raise NotImplementedError()
    
    def get_item_def_entry(self, config: ModelData, item: str) -> None|JsonType:
        """Overridden to return the entry for the item-model-definition, or None to point to ModelData.model string"""
        return None
    
    def add_namespace(self, namespace: str):
        """Overridden to add namespace data to sub-config fields added by a template"""
        return self.dict()
    
    def mutate_config(self, config: ModelData):
        """Overridden to let a template mutate/mangle root level fields of ModelData"""
        pass

class TransformOptions(BaseModel, extra=Extra.allow):
    """A pydantic model to extend for configured model transformers, which add model offset/scale ect.. to model files"""
    name: ClassVar[str]
    def __init_subclass__(cls) -> None:
        cls.__config__.extra = Extra.ignore # prevent subclasses from inheriting Extra.allow

    def dict(self, **kwargs: Any) -> JsonType:
        return super().dict(**kwargs) | {"name": self.name} # ensure name class-var is preserved in dict-casting
    
    def apply_transform(self, model: Model) -> None:
        """Modifies the given model, applying transformation data to the display compound"""
        raise NotImplementedError()

class ContainerGuiOptions(BaseModel, extra=Extra.allow):
    """a pydantic model to extend for container gui fonts"""
    container: ClassVar[str]
    def __init_subclass__(cls) -> None:
        cls.__config__.extra = Extra.ignore # prevent subclasses from inheriting Extra.allow

    def process(self, config: GuiFont, counter_cache: Cache) -> tuple[str, list[JsonType]]:
        """requisitions unicode characters and returns the translation and font providers that make it up"""
        raise NotImplementedError()
    
    def next_unicode(self, counter_cache: Cache) -> str:
        ret = counter_cache.json["__next__"]
        counter_cache.json["__next__"] += 1
        return chr(ret)

    def dict(self, **kwargs: Any) -> JsonType:
        return super().dict(**kwargs) | {"container": self.container} # ensure name class-var is preserved in dict-casting
    
    
NestedModelData.update_forward_refs()
ModelData.update_forward_refs()
GuiFont.update_forward_refs()

#== Beet Plugins ==#
def beet_default(ctx: Context):
    rp = ctx.inject(GM4ResourcePack)
    tl = ctx.inject(TranslationLinter)
    ctx.require("mecha.contrib.json_files")
    # mecha register
    ctx.inject(Mecha).transform.extend(rp)
    ctx.inject(Mecha).lint.extend(tl)

    logging.getLogger("beet.contrib.babelbox").addFilter(block_incomplete_translation)
    logging.getLogger("mecha").addFilter(limit_mecha_diagnostics)

    # attach context to template classes
    VanillaTemplate.vanilla = Vanilla(ctx)
    VanillaTemplate.vanilla.minecraft_version = '1.21.5'
    VanillaTemplate.vanilla_jar = VanillaTemplate.vanilla.mount("assets/minecraft/items")

    yield
    tl.warn_unused_translations()
    tl.apply_babelbox_backfill()
    rp.lint_model_textures()

def build(ctx: Context):
    rp = ctx.inject(GM4ResourcePack)
    rp.resolve_config()
    rp.generate_gui_fonts()
    rp.update_modeldata_registry()
    rp.generate_model_files()
    rp.generate_item_definitions()

    if not ctx.assets.extra.get("pack.png") and ctx.data.extra.get("pack.png"):
        ctx.assets.icon = ctx.data.icon

def setup(ctx: Context):
    mount_registry(ctx)

    # init font counter
    ctx.cache["gui_font_counter"].json = {
        "__next__": ord("\u9000")
    }

    # check for CLI meta-variable for backfilling the translations.csv
    ## beet -s meta.gm4.babelbox_backfill=True dev bat_grenades
    babelbox_backfill: bool = ctx.meta.get("gm4",{}).get("babelbox_backfill", False)

    # clear and compile cross-module translation key list
    ctx.cache["translations"].clear()
    keys: list[str] = []
    for path in glob.glob("*/assets/translations.csv"):
        with open(path) as f:
            reader = csv.DictReader(f)
            if reader.fieldnames and reader.fieldnames[0] != "key":
                raise KeyError(f"{path} must contain a column named 'key'")
            keys.extend([row['key'] for row in reader]) # type: ignore ; csv only contains strings
    ctx.cache["translations"].json = {"keys": list(set(keys)), "backfill": babelbox_backfill}

def mount_registry(ctx: Context):
    ctx.cache["modeldata_registry"].json = JsonFile(source_path="gm4/modeldata_registry.json").data

def dump_registry(ctx: Context):
    registry = ctx.cache["modeldata_registry"].json
    # sort registriy alphabetically and numerically
    registry["items"] = dict(sorted(registry["items"].items()))
    for item_id, ref_map in registry["items"].items():
        registry["items"][item_id] = dict(sorted(ref_map.items(), key=lambda e: e[1]))

    JsonFile(registry).dump(origin="", path="gm4/modeldata_registry.json")
    ctx.cache["modeldata_registry"].delete()

def pad_item_def_range_dispatch(ctx: Context):
    for item_def in ctx.assets["minecraft"].item_models.values():
        vanilla_item_def = item_def.data["model"]["fallback"]
        entries: list[Any] = item_def.data["model"]["entries"]
        prior_cmd = 1e8
        for i, entry in reversed(list(enumerate(entries))):
            if prior_cmd-(prior_cmd:=entry["threshold"]) > 1: # theres a gap to fill
                entries.insert(i+1, {
                    "threshold": prior_cmd+1,
                    "model": vanilla_item_def
                })

def merge_policy(ctx: Context):
    ctx.assets.merge_policy.extend_namespace(ItemModel, item_definition_merging)

def link_resource_pack(ctx: Context):
    """manually links the combined resource pack to minecraft's RP folder when using 'beet dev'"""
    ctx.assets.name = "DEV gm4_resource_pack"
    lm = ctx.inject(LinkManager)

    # clear DP link, we only want to send a RP to minecraft
    dp_dir = lm.data_pack
    lm.data_pack = None

    lm.autosave_handler(ctx) # send RP to minecraft

    lm.data_pack = dp_dir # restore the DP link

class GM4ResourcePack(MutatingReducer, InvokeOnJsonNbt):
    """Service Object handling custom_model_data and generated item models"""

    def __init__(self, ctx: Context):
        self.ctx = ctx
        self.cmd_prefix = CUSTOM_MODEL_PREFIX # enables value to be changed by other projects, like the public server
        self.registry = ctx.cache["modeldata_registry"].json
        self.logger = parent_logger.getChild(ctx.project_id)
        self._opts = FlatResourcePackOptions(model_data=[], gui_fonts=[]) # unloaded config
        super().__init__()

    @property
    def opts(self) -> FlatResourcePackOptions:
        return self._opts
    
    def resolve_config(self):
        if (p:=self.ctx.directory/"assets/model_data.yaml").exists():
            addtl_config = YamlFile(source_path=p).data.get("model_data")
            self.ctx.meta["gm4"].setdefault("model_data",[]).extend(addtl_config)
        self._opts = self.ctx.validate("gm4", validator=ResourcePackOptions).process_inheritance()
        self._opts.add_namespace(self.ctx.project_id)
        self._opts.template_mutations()

    #== Custom Model Data registration and management ==#
    def update_modeldata_registry(self):
        """Updates shared modeldata_registry.json with entries from the beet.yaml"""
        item_registry: dict[str, dict[str, int]] = self.registry.setdefault("items", {})

        # add new references and assign values
        for m in self.opts.model_data:
            conflicts = False
            i, err = self.retrieve_index(m.reference)
            if not err: # existing index, is it available to assign to all items?
                for item_id in m.item.entries():
                    reg = item_registry.setdefault(item_id, {})
                    used_idxs = {k: reg[k] for k in reg.keys() - {m.reference}}.values()
                    if i in used_idxs:
                        self.logger.warning(f"Failed to share existing custom_model_data for '{m.reference}' to '{item_id}'. A new value will be assigned for this reference; existing items may lose their texture!")
                        conflicts = True
                if not conflicts: # existing CMD is available to apply to any new items
                    for item_id in [e for e in m.item.entries() if m.reference not in item_registry.get(e, {})]:
                        self.set_index(item_id, i, m.reference)
            if err or conflicts: # no existing index, or existing isn't available; get a new one
                self.find_new_index(m.item.entries(), m.reference)

        # remove unused references
            # NOTE deleting modeldata is really only supported for development cycles. Once published, a cmd value should be permanent.
            # Thus, a reference will only be removed if it is no longer present on *any* item in the beet.yaml
        all_refs = {r.reference for r in self.opts.model_data if r.reference.startswith(self.ctx.project_id)}
        for item_id, reg in item_registry.items():
            for ref in list(reg.keys()):
                if ref.startswith(self.ctx.project_id) and ref not in all_refs and self.ctx.project_id != 'gm4':
                    self.logger.info(f"Removing undefined custom_model_data from {item_id} registry: '{ref}'")
                    del reg[ref]

    def generate_item_definitions(self):
        """Generates item-model-definition files in the 'minecraft' namespace, adding range_dispatch entries for each custom_model_data value"""
        vanilla = self.ctx.inject(Vanilla)
        vanilla.minecraft_version = '1.21.5'
        vanilla_item_defs_jar = vanilla.mount("assets/minecraft/items")
        # group models by item id
        for item_id in {i for m in self.opts.model_data for i in m.item.entries()}:
            models = filter(lambda m: item_id in m.item.entries(), self.opts.model_data) # with this item_id
            models = sorted(models, key=lambda m: self.retrieve_index(m.reference)[0])

            vanilla_itemdef = vanilla_item_defs_jar.assets.item_models[f"minecraft:{item_id}"].data["model"]

            new_itemdef: dict[str, Any] = {
                "model": {
                    "type": "minecraft:range_dispatch",
                    "property": "minecraft:custom_model_data",
                    "entries": [],
                    "fallback": vanilla_itemdef
                }
            }
            itemdef_entries: list[Any] = new_itemdef["model"]["entries"]

            for model in models:
                if isinstance(model.template, str):
                    continue # TODO is this correct?

                if not (m:=model.template.get_item_def_entry(model, item_id)):
                    # no special handling, just point to model file by name
                    m = model.model[item_id] # model string for this particular item id
                    model_json: JsonType = {
                        "type": "minecraft:model",
                        "model": m
                    }
                else:
                    model_json = m
            
                itemdef_entries.append({
                    "threshold": self.cmd_prefix+self.retrieve_index(model.reference)[0],
                    "model": model_json
                })
            
            itemdef_entries.sort(key=lambda entry: entry["threshold"]) # sort entries ascending
            self.ctx.assets.item_models[f"minecraft:{item_id}"] = ItemModel(new_itemdef)

    def retrieve_index(self, reference: str) -> tuple[int, KeyError|None]:
        """retrieves the CMD value for the given reference"""
        for reg in self.registry["items"].values():
            if reference in reg:
                return reg[reference], None
        return -self.cmd_prefix, KeyError(f"{reference} has no asscioated index")
    
    def find_new_index(self, item_ids: list[str], reference: str):
        """finds the next available CMD value for the given items and applies it to the registry"""
        try:
            allocation_id = next(filter(lambda k: fnmatch(self.ctx.project_id, k), self.registry["allocations"].keys())) #type: ignore ; type checker thinks 'k' is _T@next, not str
        except StopIteration:
            allocation_id = None
        l, u = self.registry["allocations"].get(allocation_id, (1,99))
        available_indices = set(range(l, u+1))

        for item_id in item_ids:
            used_values = set(self.registry["items"].get(item_id, {}).values())
            available_indices -= used_values

        if not available_indices:
            self.logger.warning("No Valid CMD is open for assignment! Your module may require a specially assigned value allocation if registering many CMD values.")
            raise RuntimeError("Ran out of CMD values to assign!")
        
        i = min(available_indices)
        self.logger.info(f"Issuing new custom_model_data for '{reference}': {i}")
        for item_id in item_ids:
            self.set_index(item_id, i, reference)
    
    def set_index(self, item_id: str, index: int, reference: str):
        """sets the given cmd index on the item"""
        if os.getenv("GITHUB_ACTIONS"):
            self.logger.error(f"Model-Data cache is outdated. Github Actions cannot issue custom_model_data. Run the build locally and commit changes to modeldata_registry.json")
            sys.exit(1) # stop the build and mark the github action as failed

        self.registry.setdefault("items", {}).setdefault(item_id, {})[reference] = index
        self.logger.info(f"Issuing custom_model_data {index} for {item_id}")


    #== Mecha Transformer Rules ==#
    @rule(AstJsonObjectEntry, key=AstJsonObjectKey(value="minecraft:custom_model_data"))
    def json_substitutions(self, node: AstJsonObjectEntry, **kwargs: Any):
        reference = node.value.evaluate()
        if isinstance(reference, str):
            index, exc = self.retrieve_index(add_namespace(reference, self.ctx.project_id))
            if exc:
                yield Diagnostic("error", str(exc), filename=kwargs.get("filename"), file=kwargs.get("file"))
            node = replace(node, value=AstJsonValue.from_value({ "floats": [index+self.cmd_prefix] }))
        return node
    
    @rule(AstJsonObject)
    def json_substitutions_item_modifier(self, node: AstJsonObject, **kwargs: Any):
        match node.evaluate():
            case {"function": "minecraft:set_custom_model_data"}:
                yield Diagnostic("error", "Item modifier set_custom_model_data is not supported", filename=kwargs.get("filename"), file=kwargs.get("file"))
            case _: pass
        return node

    @rule(AstNbtCompoundEntry, key=AstNbtCompoundKey(value="minecraft:custom_model_data"))
    def cmd_substitutions_nbt(self, node: AstNbtCompoundEntry, **kwargs: Any):
        if isinstance(node.value, AstNbtValue) and isinstance(node.value.value, String):
            index, exc = self.retrieve_index(add_namespace(node.value.value, self.ctx.project_id))
            if exc:
                yield Diagnostic("error", str(exc), filename=kwargs.get("filename"), file=kwargs.get("file"))
            node = replace(node, value=AstNbtValue.from_value({ "floats": [index+self.cmd_prefix] }))
        return node

    @rule(AstItemComponent)
    @rule(AstItemPredicateTestComponent)
    def cmd_substitutions_component(self, node: AstItemComponent | AstItemPredicateTestComponent, **kwargs: Any):
        if node.value and node.key.get_canonical_value() == "minecraft:custom_model_data":
            if isinstance(node.value, AstNbtValue) and isinstance(node.value.value, String):
                index, exc = self.retrieve_index(add_namespace(node.value.value, self.ctx.project_id))
                if exc:
                    yield Diagnostic("error", str(exc), filename=kwargs.get("filename"), file=kwargs.get("file"))
                node = replace(node, value=AstNbtValue.from_value({ "floats": [index+self.cmd_prefix] }))
        return node

    @rule(AstCommand, identifier="data:modify:storage:target:targetPath:set:value:value")
    @rule(AstCommand, identifier="data:modify:block:targetPos:targetPath:set:value:value")
    @rule(AstCommand, identifier="data:modify:entity:target:targetPath:set:value:value")
    def cmd_substitutions_datamodify(self, node: AstCommand):
        ast_target, ast_target_path, ast_nbt = node.arguments
        match ast_target_path, ast_nbt:
            case AstNbtPath(components=[*_, AstNbtPathKey(value="minecraft:custom_model_data")]), AstNbtValue(value=String(reference)):
                index, exc = self.retrieve_index(add_namespace(reference, self.ctx.project_id))
                if exc:
                    d = Diagnostic("error", str(exc))
                    yield set_location(d, ast_nbt)
                node = replace(node, arguments=AstChildren([ast_target, ast_target_path, AstNbtValue.from_value({ "floats": [index+self.cmd_prefix] })]))
            case _:
                pass
        return node


    #== Model file generation ==#
    def generate_model_files(self):
        """Create individual models for each item/block according to its config"""
        for model in self.opts.model_data:
            if isinstance(model.template, str): # type annotation, ensured by model validation
                continue
            
            # generate model and mount to the pack
            model.template.generate_model(model, self.ctx.assets.models)

    def lint_model_textures(self):
        """Checks model files to ensure referenced textures exist"""
        for name, model in list(self.ctx.assets.models.items()):
            if name.startswith("minecraft:"):
                continue # vanilla model - will have vanilla textures so do not check
            for tex in model.data.get("textures", {}).values():
                if not tex.startswith("minecraft:") and tex not in self.ctx.assets.textures:
                    self.logger.warning(f"Missing texture '{tex}' in {name}")
    
    #== Font-Gui file generation ==#
    def generate_gui_fonts(self):
        for gui in self.opts.gui_fonts:
            if not isinstance(gui.container, ContainerGuiOptions):
                continue # model validation ensures this

            translation, providers = gui.container.process(gui, self.ctx.cache["gui_font_counter"])
            self.ctx.generate("gm4:en_us", merge=Language({
                gui.translation: translation
            }))
            self.ctx.generate("gm4:container_gui", merge=Font({
                "providers": providers
            }))

def item_definition_merging(pack: ResourcePack, path: str, current: ItemModel, conflict: ItemModel) -> bool:
    """ItemModel beet merge rule for combining range_dispatch properly"""
    if current.data["model"].get("type") != "minecraft:range_dispatch" or conflict.data["model"].get("type") != "minecraft:range_dispatch":
        parent_logger.warning(f"item model {path} was sent to merging but only one file uses 'range_dispatch'")
        return False
    
    merged_entries: list[Any] = current.data["model"]["entries"]
    merged_entries.extend(conflict.data["model"]["entries"])
    merged_entries.sort(key=lambda entry: entry["threshold"])

    # remove duplicate entries - relying on each CMD to be unique already
    seen_values: set[int] = set()
    for entry in merged_entries.copy():
        if (v:=entry["threshold"]) not in seen_values:
            seen_values.add(v)
        else: # otherwise its a duplicate
            merged_entries.remove(entry)

    return True


class TranslationLinter(Reducer):
    """Mecha linter ensuring all translation keys are registered in translations.csv"""
    def __init__(self, ctx: Context):
        self.ctx = ctx
        self.mecha_database = ctx.inject(Mecha).database
        vanilla = ctx.inject(Vanilla)
        vanilla.minecraft_version = '1.21.5'
        vanilla_lang = vanilla.mount("assets/minecraft/lang/en_us.json")
        self.vanilla_keys = set(vanilla_lang.assets.languages["minecraft:en_us"].data.keys())
        self.total_keys: set[str] = set()
        self.local_keys: set[str] = set()
        self.used_keys: set[str] = set()
        self.logger = parent_logger.getChild(ctx.project_id)
        self.backfill_enable: bool = ctx.cache["translations"].json["backfill"]
        self.backfill_values: dict[str, str] = {}
        self.ignored_keys: set[str] = set(ctx.validate("gm4", TranslationLinterOptions).translation_linter_ignores)
        super().__init__()

    @rule(AstNbtValue)
    def check_nbt_json(self, node: AstNbtValue):
        mc = self.ctx.inject(Mecha)
        if isinstance(node.value, (String, str)):
            try:
                json_ast = mc.parse(node.value, type=AstJson)
                with self.use_diagnostics(collec:=DiagnosticCollection()):
                    self.invoke(json_ast) # process new node with reducer rules
                for exc in collec.exceptions:
                    yield propagate_location(exc, node)
            except DiagnosticError:
                pass # string is not json

    @rule(AstNbtCompound)
    @rule(AstJsonObject)
    def missing_en_us_translations(self, node: Union[AstNbtCompound, AstJsonObject]):
        self.setup_translation_lookups()
                
        # manually skip gm4 root advancement, which contains globally defined translations
        resource_location = self.mecha_database[self.mecha_database.current].resource_location or "null:null"
        if resource_location == "gm4:root":
            return
        
        # check node fallback contents against babelbox translations
        translate_entry = next((e for e in node.entries if e.key.value == "translate"), None)
        if not translate_entry:
            return
        transl_key = str(translate_entry.value.evaluate())
        fallback_extry = next((e for e in node.entries if e.key.value == "fallback"), None)
        if fallback_extry:
            fallback = str(fallback_extry.value.evaluate())
            if transl_key.startswith("gui.gm4") or transl_key=="gm4.second":
                # gui-texture translations from other modules are defined in their gui_fonts segment of beet.yaml, so they won't be
                # known to the linter easily. For now, we just ignore their warnings
                return
            if self.babelbox_lang.get(transl_key) != fallback:
                if transl_key in self.babelbox_lang and not self.backfill_enable:
                    yield set_location(Diagnostic("info", f"Fallback for {transl_key} does not match that provided in 'translations.csv'"), node)
                elif self.backfill_enable and transl_key not in self.backfill_values and transl_key not in self.foreign_keys:
                    self.logger.info(f"Backfilling the fallback for {transl_key} into 'translations.csv'")
                    self.backfill_values[transl_key] = fallback
            yield self.check_key(transl_key, node)
        else:
            if self.babelbox_lang.get(transl_key):
                yield set_location(Diagnostic("warn", f"No translation fallback specified for {transl_key}"), node)
            yield self.check_key(transl_key, node)

    def check_key(self, transl_key: str, node: Any):
        self.used_keys.add(transl_key)
        if transl_key not in self.total_keys and not self.backfill_enable:
            return set_location(Diagnostic("warn", f"Translation key not defined in en_us: {transl_key}"), node)
        return

    def setup_translation_lookups(self):
        # setup lookup list if first invocation
        if not self.total_keys:
            self.babelbox_lang = self.ctx.assets.languages.get("gm4_translations:en_us", Language()).data
            self.local_keys = (
                set(self.babelbox_lang.keys()) |
                set(self.ctx.assets.languages.get("gm4:en_us", Language()).data.keys())
            )
            self.total_keys = (
                self.vanilla_keys |
                self.local_keys | 
                self.ignored_keys | 
                set(Language(source_path="base/assets/gm4/lang/en_us.json").data.keys()) |
                self.get_guidebook_translations() |
                set(self.ctx.cache["translations"].json["keys"]) |
                {"%1$s%3427655$s", "%1$s%3427656$s"} # manual old keys
            )
            self.foreign_keys = self.total_keys - self.local_keys

    @cache
    def get_guidebook_translations(self) -> set[str]:
        # internally loads keys in guidebook translations.csv, cached for each subproject build
        with open("gm4_guidebook/assets/translations.csv", 'r') as csvfile:
            reader = csv.DictReader(csvfile)
            return {row["key"] for row in reader}

    def warn_unused_translations(self):
        for key in self.ctx.assets.languages.get("gm4_translations:en_us", Language()).data:
            if key not in self.used_keys and key not in self.ignored_keys and key in self.local_keys:
                self.logger.warning(f"Translation '{key}' is defined but not used")

    def apply_babelbox_backfill(self):
        """Takes found out-of-date fallbacks and saves them to the translations.csv table"""
        if not self.backfill_enable:
            return
        
        if (c:=self.ctx.directory / "assets" / "translations.csv").exists():
            babelbox_path = c
        elif (c:=self.ctx.directory / "translations.csv").exists():
            babelbox_path = c
        else:
            if self.backfill_values:
                self.logger.warning("Babelbox backfill was enabled but no 'translations.csv' file was found")
            return # no file to update
        
        with open(babelbox_path, 'r', encoding='utf-8', newline='') as csvfile:
            reader = csv.DictReader(csvfile)
            fieldnames = reader.fieldnames
            if not fieldnames:
                self.logger.warning("Babelbox backfill failed - fieldnames could not be automatically detected")
                return
            translations = list([row for row in reader])

        with open(babelbox_path, 'w', encoding='utf-8', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames, extrasaction='ignore')
            writer.writeheader()
            for row in translations:
                new_fallback = {"en_us": fbk.replace("\n", "\\n")} if (fbk:=self.backfill_values.pop(row["key"], None)) else {}
                writer.writerow(row | new_fallback)
            for key, fbk in self.backfill_values.items(): # any remaining new entries not already in file
                writer.writerow({"key": key, "en_us": fbk.replace("\n", "\\n")})


#== Logging Filters ==#
def block_incomplete_translation(record: logging.LogRecord):
    """logger filter to hide missing translations for anything but default english"""
    locale: str = record.args[0] # type: ignore ; babelbox only issues one logger event, this will be a string
    return locale == 'en_us'

def limit_mecha_diagnostics(record: logging.LogRecord):
    """hard limits the printed length of a mecha diagnostic line"""
    TRUNCATION_LENGTH = 1_000
    truncated: list[str] = []
    for line in record.args[0].splitlines(): # type: ignore ; arg 0 is a paragraph of diagnostic text
        truncated.append(line if len(line) < TRUNCATION_LENGTH else line[:TRUNCATION_LENGTH-3] + "...") # type: ignore ; line is a str
    record.args = ("\n".join(truncated),)
    return True
    
#== Default Templates, Transforms and Item Model Special Cases ==#
def ensure_single_model_config(template_name: str, config: ModelData) -> str:
    """Does common error checking for templates that only work when creating a single model file"""
    if len(config.model.entries()) > 1:
        raise InvalidOptions("gm4.model_data", f"{config.reference}; Template '{template_name}' only supports single entry 'model' fields.")
    return config.model.entries()[0]

class BlankTemplate(TemplateOptions):
    name = "custom"

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        """A model file will be provided in source - do not generate a model.
            Will process any specified transforms and add them to the model file"""
        if config.transforms:
            ret_list: list[Model] = []
            for m in config.model.entries():
                try:
                    ret_list.append(models_container[m])
                except:
                    parent_logger.warning(f"Custom specified model {m} does not exist, but was configured to recieve transforms.")
            return ret_list
        return []

class GeneratedTemplate(TemplateOptions):
    name = "generated"

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        if len(config.textures.entries()) > 1:
            raise InvalidOptions("gm4.model_data", f"{config.reference}; Template 'generated' currently only supports a single texture.")
            # NOTE in the future, `generated` could accept a map for textures to provide a different texture for each model. But packs may be better served by simply creating those models themselves    
        
        ret_list: list[Model] = []
        for model_name in config.model.entries():
            m = models_container[model_name] = Model({
                "parent": "minecraft:item/generated",
                "textures": {
                    "layer0": f"{config.textures.entries()[0]}"
                }
            })
            ret_list.append(m)
        return ret_list
    
class GeneratedOverlayTemplate(TemplateOptions):
    name = "generated_overlay"

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        """A special-case 'generated' template, where an 'overlay' texture is specified by appending '_overlay' to its filename"""
        model_name = ensure_single_model_config(self.name, config)
        m = models_container[model_name] = Model({
            "parent": "minecraft:item/generated",
            "textures": {
                "layer0": f"{config.textures.entries()[0]}",
                "layer1": f"{config.textures.entries()[0]}_overlay"
            }
        })
        return [m]

class HandheldTemplate(TemplateOptions):
    name = "handheld"

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]):
        model_name = ensure_single_model_config(self.name, config)
        m = models_container[model_name] = Model({
            "parent": "minecraft:item/handheld",
            "textures": {
                "layer0": f"{config.textures.entries()[0]}"
            }
        })
        return [m]

class VanillaTemplate(TemplateOptions):
    name = "vanilla"
    vanilla: ClassVar[Vanilla] # mounted to by beet plugin since it requires context access
    vanilla_jar: ClassVar[ClientJar]
    _item_def_map: dict[str, JsonType] = {}

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]):
        model_names = config.model.entries()
        if len(set(model_names)) == 1 and len(config.item.entries()) > 1:
            model_names = [f"{model_names[0]}_{item}" for item in config.item.entries()] # if only one model name given, make one model per item id
        
        model_def_map: dict[str,JsonType] = {}

        ret_list: list[Model] = []
        for item, model_name in zip(config.item.entries(), model_names):
            model_compound = self.vanilla_jar.assets.item_models[add_namespace(item, "minecraft")].data.get("model", {})
            if model_compound["type"] == "minecraft:select": # template off the fallback model, (e.g. non-festive chest)
                model_compound = model_compound["fallback"]

            if model_compound["type"] == "minecraft:special": # uses some special handling
                vanilla_model_path: str = model_compound["base"] # covers player_head use case. Others may not be handled properly yet.
                special_model = True
            else:
                vanilla_model_path: str = model_compound.get("model", "")
                special_model = False
            m = models_container[model_name] = Model({
                "parent": vanilla_model_path
            })
            ret_list.append(m)
            model_def_map[item] = {
                "type": "minecraft:special" if special_model else "minecraft:model",
                "model": model_compound["model"] if special_model else model_name,
            } | (
                {"base": model_name} if special_model else {}
            ) | (
                {"tints": t} if (t:=model_compound.get("tints")) else {}
            )
        self._item_def_map.update(model_def_map)
        return ret_list
    
    def get_item_def_entry(self, config: ModelData, item: str):
        return self._item_def_map.get(item)

class AdvancementIconTemplate(VanillaTemplate, TemplateOptions): # TODO make this inheritance work properly. Treat as single-vanilla forward or create new where needed
    """Creates a model for advancement icons, either pointing to the vanilla model, or to a specified other item model"""
    name = "advancement"
    forward: Optional[str]
    tints: Optional[ListOption[int|tuple[float,float,float]]] # optional constant tints to apply to the item model

    # NOTE since advancements are all in the gm4 namespace, so are these models. This template ignores the 'model' field of ModelData
    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        advancement_name = config.reference.split("/")[-1]
        item = config.item.entries()[0]

        if not self.forward:
            # then we use the vanilla item's model and settings - inheriting from VanillaTemplate for this
            config_copy = config.copy(update={"model": MapOption(__root__={item: f"gm4:gui/advancement/{advancement_name}"})})
            m = VanillaTemplate.create_models(self, config_copy, models_container)[0]
        
        else:
            m = models_container[f"gm4:gui/advancement/{advancement_name}"] = Model({
                "parent": self.forward
            })
        config.model = MapOption(__root__={item: f"gm4:gui/advancement/{advancement_name}"})
        return [m]
    
    def get_item_def_entry(self, config: ModelData, item: str):
        if not self.forward: # use item def from VanillaTemplate
            return VanillaTemplate.get_item_def_entry(self, config, item)
        else:
            if self.tints:
                return {
                    "type": "model",
                    "model": config.model.entries()[0],
                    "tints": [
                        {
                            "type": "minecraft:constant",
                            "value": tint
                        }
                        for tint in self.tints.entries()
                    ]
                }
        return None
    
    def add_namespace(self, namespace: str):
        return self.dict() | ({"forward": add_namespace(self.forward, namespace)} if self.forward else {})

class BlockTemplate(TemplateOptions):
    name = "block"
    texture_map = ["top", "bottom", "front", "side"]

    def create_models(self, config: ModelData, models_container: NamespaceProxy[Model]):
        model_name = ensure_single_model_config(self.name, config)
        m = models_container[model_name] = Model({
            "parent": "minecraft:block/cube",
            "textures": {
                "particle": config.textures['side'],
                "down":     config.textures['bottom'],
                "up":       config.textures['top'],
                "north":    config.textures['front'],
                "south":    config.textures['side'],
                "west":     config.textures['side'],
                "east":     config.textures['side']
            }
        })
        return [m]
    
class ConditionTemplate(BlankTemplate, TemplateOptions):
    """Custom models using boolean condition variants (ie. broken/repaired elytra, cast/uncast fishing rods...)"""
    name = "condition"
    property: str
    on_true: str
    on_false: str

    def get_item_def_entry(self, config: ModelData, item: str) -> JsonType:
        return {
            "type": "minecraft:condition",
            "property": self.property,
            "on_false": {
                "type": "minecraft:model",
                "model": self.on_false
            },
            "on_true": {
                "type": "minecraft:model",
                "model": self.on_true
            }
        }
    
    def add_namespace(self, namespace: str):
        return self.dict() | {"on_true": add_namespace(self.on_true, namespace),
                              "on_false": add_namespace(self.on_false, namespace)}

class ItemDisplayModel(TransformOptions):
    """Calculates the model transform for an item_display entity, located at the specified origin, facing south, for the model to align with the block-grid"""
    origin: list[float] = Field(..., max_items=3, min_items=3)
    scale: list[float] = Field(..., max_items=3, min_items=3)
    translation: list[float] = Field(default=[0,0,0], max_items=3, min_items=3)
    rotation: list[float] = Field(default=[0.,0.,0.], max_items=3, min_items=3) # euler angle form of total rotation. NOTE only accounts for simple angles (90,180 ect...)
    display: Literal["none", "thirdperson_lefthand", "thirdperson_righthand", "firstperson_lefthand", "firstperson_righthand", "head", "gui", "ground", "fixed"] = "head"
    name: ClassVar[str] = "item_display"

    def apply_transform(self, model: Model):
        model.data.setdefault("display", {})[self.display] = {
            "rotation": list(-1*np.array(self.rotation)),
            "translation": list(16 * (np.array([-0.5,0.5,-0.5])+(np.array(self.origin)*np.array([1,-1,1]))-np.array(self.translation)) / np.array(self.scale)), # type: ignore ; self.origin*[1,-1,1] is faulty interpreted by type checker as ndarray[bool_]
            "scale": list(1/np.array(self.scale)*1.006)
        }

#== Convience Template/Transform Presets ==#
class LegacyMachineArmorStand(BlockTemplate, TemplateOptions):
    """An 'block' template preset with the 'item_display' transformer for the legacy small-armor-stand-head-slot of custom crafters"""
    default_transforms = [
        ItemDisplayModel(
            origin=[0.5, 1, 0.5],
            scale=[0.438, 0.438, 0.438],
            translation=[0, 0, 0],
            display='head'
        )
    ]
    name = "legacy_machine_block"


#== Default Gui-Font Generators ==#
class CenteredContainerGui(ContainerGuiOptions):
    container = "_centered"

    def process(self, config: GuiFont, counter_cache: Cache) -> tuple[str, list[dict[str, Any]]]:
        u1 = self.next_unicode(counter_cache)
        u2 = self.next_unicode(counter_cache)
        return u2+u1+u2, [
            {
                "type": "bitmap",
                "file": config.texture+".png",
                "ascent": 13,
                "height": 166,
                "chars": [u1]
            },
            {
                "type": "bitmap",
                "file": config.texture+".png",
                "ascent": -32768,
                "height": -83,
                "chars": [u2]
            }
        ]

class LeftAlignContainerGui(ContainerGuiOptions):
    container = "_left_align"

    def process(self, config: GuiFont, counter_cache: Cache) -> tuple[str, list[dict[str, Any]]]:
        u1 = self.next_unicode(counter_cache)
        u2 = self.next_unicode(counter_cache)
        return "\uf808"+u1+u2+"\uf824", [
            {
                "type": "bitmap",
                "file": config.texture+".png",
                "ascent": 13,
                "height": 133,
                "chars": [u1]
            },
            {
                "type": "bitmap",
                "file": config.texture+".png",
                "ascent": -32768,
                "height": -133,
                "chars": [u2]
            },
        ]

class HopperContainerGui(LeftAlignContainerGui, ContainerGuiOptions):
    container = "hopper"

class DropperContainerGui(CenteredContainerGui, ContainerGuiOptions):
    container = "dropper"
