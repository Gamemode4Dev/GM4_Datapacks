from beet import Context, Model, NamespaceProxy, ListOption, ResourcePack
from beet.contrib.vanilla import Vanilla, ClientJar
from beet.contrib.optifine import OptifineProperties
from typing import Any, ClassVar, Literal
from itertools import product, chain, count
import re
import logging

from gm4.plugins.resource_pack import ModelData, TemplateOptions
from gm4.utils import add_namespace, MapOption

parent_logger = logging.getLogger("gm4."+__name__)

TOOL_MATERIALS = ["wooden", "stone", "iron", "golden", "diamond", "netherite"]
ARMOR_MATERIALS = ["leather", "chainmail", "iron", "golden", "diamond", "netherite"]
TOOLS = ["axe", "hoe", "pickaxe", "shovel"]
ARMOR = ["boots", "chestplate", "helmet", "leggings"]
BUCKETABLE = ["water", "lava", "milk", "powder_snow", "cod", "salmon", "pufferfish", "tropical_fish", "tadpole", "axolotl"]

TEXTURELESS = ["shield"] # item model is unable to receive layer in vanilla

# define item group lookups
GROUP_LOOKUP = {
    "armor": [f"{material}_{armor}" for material, armor in product(ARMOR_MATERIALS, ARMOR)] + ["turtle_helmet"],
    "tools": [f"{material}_{tool}" for material, tool in product(TOOL_MATERIALS, TOOLS)],
    "weapons": [f"{material}_{weapon}" for  material, weapon in product(TOOL_MATERIALS, ["sword", "axe"])] + ["trident"],

    "pickaxes": [f"{material}_pickaxe" for material in TOOL_MATERIALS],
    "shovels": [f"{material}_shovel" for material in TOOL_MATERIALS],
    "axes": [f"{material}_axe" for material in TOOL_MATERIALS],
    "hoes": [f"{material}_hoe" for material in TOOL_MATERIALS],
    "swords": [f"{material}_sword" for material in TOOL_MATERIALS],

    "boots": [f"{material}_boots" for material in ARMOR_MATERIALS],
    "leggings": [f"{material}_leggings" for material in ARMOR_MATERIALS],
    "chestplates": [f"{material}_chestplate" for material in ARMOR_MATERIALS],
    "helmets": [f"{material}_helmet" for material in ARMOR_MATERIALS] + ["turtle_helmet"],

    "buckets": [f"{substance}_bucket" for substance in BUCKETABLE] + ["bucket"]
}

TEXTURE_LOOKUP = { # what texture to use if the exact item name is not present
    item: "boots" for item in GROUP_LOOKUP["boots"]} | {
    item: "leggings" for item in GROUP_LOOKUP["leggings"]} | {
    item: "chestplate" for item in GROUP_LOOKUP["chestplates"]} | {
    item: "helmet" for item in GROUP_LOOKUP["helmets"]} | {
    item: "pickaxe" for item in GROUP_LOOKUP["pickaxes"]} | {
    item: "shovel" for item in GROUP_LOOKUP["shovels"]} | {
    item: "axe" for item in GROUP_LOOKUP["axes"]} | {
    item: "hoe" for item in GROUP_LOOKUP["hoes"]} | {
    item: "sword" for item in GROUP_LOOKUP["swords"]} | {
    item: "bucket" for item in GROUP_LOOKUP["buckets"]} | {
    "recovery_compass": "compass",
    "carrot_on_a_stick": "fishing_rod",
    "warped_fungus_on_a_stick": "fishing_rod"
}

class ShamirTemplate(TemplateOptions):
    """Model Template for generating models for shamirs on tools/armor"""
    name = "shamir"
    texture_map = ["", "band"]
    textures_path: str = "" # directory of texture files to use for shamirs, falling back to the default metallurgy textures
    metal: Literal["aluminium", "barimium", "barium", "bismuth", "curies_bismium", "thorium"] # the metallurgy metal this shamir is made of

    bound_ctx: ClassVar[Context]
    metallurgy_assets: ClassVar[ResourcePack] = ResourcePack(path="gm4_metallurgy") # load metallurgy textures so expansion shamirs can fall back on their
    vanilla_models_jar: ClassVar[ClientJar]

    def process(self, config: ModelData, models_container: NamespaceProxy[Model]) -> list[Model]:
        logger = parent_logger.getChild(self.bound_ctx.project_id)
        models_loc = f"{config.reference}"
        models: dict[str, str|list[dict[str,Any]]] = {} # the value of config.models to be applied after going through special cases
        ret_list: list[Model] = []

        for item in config.item.entries():
            if item == "player_head":
                # create the band item-model, which shares the same CMD as all the tools/armor
                m = Model({
                    "parent": "item/generated",
                    "textures": {
                        "layer0": config.textures["band"]
                    }
                })
                models_container[f"{models_loc}/band"] = m
                ret_list.append(m)
                models.update({"player_head": f"{models_loc}/band"})
                continue


            # find the texture to use; first in this module at the path directed
            if (t:=add_namespace(f"{self.textures_path}/{item}" , self.bound_ctx.project_id)) in self.bound_ctx.assets.textures: # check for the item exactly
                texture = t
            elif (t:=add_namespace(f"{self.textures_path}/{TEXTURE_LOOKUP.get(item)}" , self.bound_ctx.project_id)) in self.bound_ctx.assets.textures: # check for a generic "axe" texture
                texture = t
            # then in the base gm4_metallurgy textures
            elif (t:=add_namespace(f"item/shamir/{self.metal}/{item}" , "gm4_metallurgy")) in self.metallurgy_assets.textures: # check for the item exactly
                texture = t
                logger.debug(f"An appropiate texture for '{item}' could not be found in {self.textures_path}, falling back to the texture {t}")
            elif (t:=add_namespace(f"item/shamir/{self.metal}/{TEXTURE_LOOKUP.get(item)}" , "gm4_metallurgy")) in self.metallurgy_assets.textures: # check for a generic "axe" texture
                texture = t
                logger.debug(f"An appropiate texture for '{item}' could not be found in {self.textures_path}, falling back to the texture {t}")
            else:
                if item not in TEXTURELESS:
                    logger.warning(f"No shamir texture for '{item}' could be found!")
                texture = "gm4:item/empty"

            # generate the models, using the vanilla models as a base
            total_layers = 0 # number of texture layers in vanilla
            base_layers = 0 # number of texture layers on the simplest item ie trim-less armor
            if item in GROUP_LOOKUP["armor"]:
                total_layers = 1 # put the texture above the trims
                base_layers = 0 # untrimmed armor has no layer1
                if item.startswith("leather"):
                    total_layers = 2 # and the dyed portion
                    base_layers = 1

            m = Model({
                "parent": f"minecraft:item/{item}",
                "textures": {
                    f"layer{base_layers+1}": texture
                }
            })
            models_container[f"{models_loc}/{item}"] = m
            ret_list.append(m)

            variants: Any = [{"model": f"{models_loc}/{item}"}] # the base model is just a regular model reference
            for override in self.vanilla_models_jar.assets.models[f"minecraft:item/{item}"].data.get('overrides', []):
                item_variant = override['model'].split('/')[-1] # ie, iron_chestplate_quartz_trim, fishing_rod_cast, compass_00, elytra_broken ect...

                texture_variant = ('/'.join(texture.split('/')[0:-1] + [item_variant])) # is there an explicit texture for this variant. ie broken_elytra.png?
                variant_tex_exists = texture_variant in self.bound_ctx.assets.textures or texture_variant in self.metallurgy_assets.textures

                m = Model({
                    "parent": f"minecraft:item/{item_variant}",
                    "textures": {
                        f"layer{total_layers+1}": texture_variant if variant_tex_exists else texture
                    }
                })
                models_container[f"{models_loc}/{item_variant}"] = m
                ret_list.append(m)
                variants.append({
                    "predicate": override['predicate'],
                    "model": f"{models_loc}/{item_variant}"
                })
            models.update({item: variants})

            # optifine .properties handling
            if item in GROUP_LOOKUP["armor"]:
                material = item.split("_")[0]

                if material == "golden":
                    material = "gold" # vanilla armor textures are called "gold_layer_1" for some reason
                layer = item.endswith("leggings")+1 # leggings use layer 2
                
                self.bound_ctx.generate(f"gm4_metallurgy:cit/{self.metal}/{item}", merge=OptifineProperties(
                    "\n".join([e for e in [
                        "type=armor",
                        f"matchItems={item}",
                        f"texture.{material}_layer_{layer}={material}_layer_{layer}",
                        f"texture.leather_layer_{layer}_overlay=leather_layer_{layer}_overlay" if material == "leather" else None,
                        f"nbt.CustomModelData=regex:(${config.reference})"
                    ] if e is not None])
                ))
            elif item in ["elytra", "trident", "spyglass"]:
                self.bound_ctx.generate(f"gm4_metallurgy:cit/{self.metal}/{item}", merge=OptifineProperties(
                    "\n".join([
                        "type=elytra" if item=="elytra" else f"type=item",
                        f"matchItems={item}",
                        f"texture.{item}={item}",
                        f"nbt.CustomModelData=regex:(${config.reference})"
                    ])
                ))

        config.model = MapOption(__root__=models)
        return ret_list
    
    def mutate_config(self, config: ModelData):
        expanded_items = set(chain.from_iterable([GROUP_LOOKUP.get(group, [group]) for group in config.item.entries()])) | {"player_head"}
        config.item = ListOption(__root__=list(expanded_items))
        config.model = MapOption(__root__={item: config.reference for item in expanded_items})
        if isinstance(config.textures.__root__, list):
            config.textures = MapOption(__root__={"band": f"gm4_metallurgy:item/band/{self.metal}_band"})
        else: # isinstance(.., dict):
            config.textures = MapOption(__root__={"band": f"gm4_metallurgy:item/band/{self.metal}_band"}|config.textures.__root__)


def optifine_armor_properties_merging(pack: ResourcePack, path: str, current: OptifineProperties, conflict: OptifineProperties) -> bool:
    if not path.startswith("gm4_metallurgy:cit"): # only apply this rule to metallurgy files
        return False

    merged = current.text.splitlines()
    pattern = re.compile(r"^nbt.CustomModelData=regex:\((.+)\)$", flags=re.MULTILINE)
    for i, current_line, conflict_line in zip(count(), current.text.splitlines(), conflict.text.splitlines()):
        current_match = pattern.match(current_line)
        conflict_match = pattern.match(conflict_line)

        if not current_match or not conflict_match: # this line is not the nbt.CustomModelData config
            if current_line != conflict_line:
                return False # the files are not the same, abort the merge
            continue # process the next line pair

        current_cmd = set(current_match.group(1).split("|"))
        conflict_cmd = set(conflict_match.group(1).split("|"))

        merged[i] = f"nbt.CustomModelData=regex:({'|'.join(sorted(current_cmd|conflict_cmd))})"


    current.text = "\n".join(merged)
    return True

def beet_default(ctx: Context):
    # bind context object to a ClassVar so it can be accessed later during template processing
    ShamirTemplate.bound_ctx = ctx
    vanilla = ctx.inject(Vanilla)
    ShamirTemplate.vanilla_models_jar = vanilla.mount("assets/minecraft/models/item")
    merge_policy(ctx)

def merge_policy(ctx: Context):
    ctx.assets.merge_policy.extend_namespace(OptifineProperties, optifine_armor_properties_merging)
    # a separate plugin to register the merge policy - used for the pyproject.toml custom policy workaround when using broadcast pipelines
