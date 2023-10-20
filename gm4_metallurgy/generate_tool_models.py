from beet import Context, Model
from beet.contrib.vanilla import Vanilla
from typing import Any
import logging

TOOL_MATERIALS = ["wooden", "stone", "iron", "golden", "diamond", "netherite"]
ARMOR_MATERIALS = ["leather", "chainmail", "iron", "golden", "diamond", "netherite"]
METALS = ["aluminium", "barimium", "barium", "bismuth", "curies_bismium", "thorium"]
TOOLS = ["axe", "hoe", "pickaxe", "shovel", "sword"]
ARMOR = ["boots", "chestplate", "helmet", "leggings"]
SPECIAL_ARMOR = ["helmet_netherite", "leggings_leather"]
PREDICATED_MODELS = ["elytra", "compass", "fishing_rod", "bow", "crossbow", "clock"]
SIMPLE_MODELS = ["trident", "flint_and_steel", "shears", "spyglass"]

special_armor_processed = tuple((e.split("_") for e in SPECIAL_ARMOR))

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    texture_tree = ctx.assets["gm4_metallurgy"].textures.generate_tree()
    vanilla = ctx.inject(Vanilla)
    vanilla_models_jar = vanilla.mount("assets/minecraft/models/item")
    
    for metal in METALS:
        models: dict[str, str|list[dict[str,Any]]] = {}
        for item in texture_tree["item"]["shamir"][metal].keys():
            # material variants of tools/armor
            if item in TOOLS:
                for material in TOOL_MATERIALS:
                    if (n:=f"gm4_metallurgy:item/shamir/{metal}/{material}_{item}") not in ctx.assets.models:
                        ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{material}_{item}"] = Model({
                            "parent": f"minecraft:item/{material}_{item}",
                            "textures": {
                                "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                            }
                        })
                    models.update({f"{material}_{item}": f"item/shamir/{metal}/{material}_{item}"})
                    

            elif item in ARMOR:
                for material in ARMOR_MATERIALS:
                    # armor with specially edited shamirs (ie netherite helmet)
                    texture_name = f"{item}_{material}" if [item, material] in special_armor_processed else item

                    if (n:=f"gm4_metallurgy:item/shamir/{metal}/{material}_{item}") not in ctx.assets.models:
                        ctx.assets.models[n] = Model({
                            "parent": f"minecraft:item/{material}_{item}",
                            "textures": {
                                f"layer{1+(material=='leather')}": f"gm4_metallurgy:item/shamir/{metal}/{texture_name}"
                            }
                        })

                    predicates: list[dict[str,Any]] = [{"model": f"gm4_metallurgy:item/shamir/{metal}/{material}_{item}"}]

                    for override in vanilla_models_jar.assets.models[f"minecraft:item/{material}_{item}"].data["overrides"]:
                        name = override['model'].split("/")[-1] # eg. iron_chestplate_quartz_trim
                        ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{name}"] = Model({
                            "parent": f"minecraft:item/{name}",
                            "textures": {
                                f"layer{2+(material=='leather')}": f"gm4_metallurgy:item/shamir/{metal}/{texture_name}"
                            }
                        })
                        predicates.append({
                            "predicate": override["predicate"],
                            "model": f"gm4_metallurgy:item/shamir/{metal}/{name}"
                        })
                    models.update({f"{material}_{item}": predicates})

            elif item in SPECIAL_ARMOR:
                pass # special case handled in main ARMOR branch
            
            elif item == "helmet_turtle":
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/turtle_helmet"] = Model({
                    "parent": f"minecraft:item/turtle_helmet",
                    "textures": {
                        "layer1": f"gm4_metallurgy:item/shamir/{metal}/helmet_turtle"
                    }
                })
                predicates: list[dict[str,Any]] = [{"model": f"gm4_metallurgy:item/shamir/{metal}/turtle_helmet"}]

                for override in vanilla_models_jar.assets.models["minecraft:item/turtle_helmet"].data["overrides"]:
                    name = override['model'].split("/")[-1] # eg. turtle_helmet_quartz_trim
                    ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{name}"] = Model({
                        "parent": f"minecraft:item/{name}",
                        "textures": {
                            "layer2": f"gm4_metallurgy:item/shamir/{metal}/helmet_turtle"
                        }
                    })
                    predicates.append({
                        "predicate": override["predicate"],
                        "model": f"gm4_metallurgy:item/shamir/{metal}/{name}"
                    })
                models.update({"turtle_helmet": predicates})

            # items with predicate model variants
            elif item in PREDICATED_MODELS:
                if item == "compass":
                    similar_items = ["compass", "recovery_compass"]
                else:
                    similar_items = [item]

                for similar_item in similar_items: # repeat for similar textures, eg compass and recovery compass
                    ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"] = Model({
                        "parent": f"minecraft:item/{similar_item}",
                        "textures": {
                            "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                        }
                    })
                    variants: Any = [{"model": f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"}] # the base model has no predicate to match
                    for override in vanilla_models_jar.assets.models[f"minecraft:item/{similar_item}"].data['overrides']:
                        item_variant = override['model'].split('/')[-1] # ie, fishing_rod_cast, compass_00 ect...
                        if (n:=f"gm4_metallurgy:item/shamir/{metal}/{item_variant}") not in ctx.assets.models:
                            ctx.assets.models[n] = Model({
                                "parent": f"minecraft:item/{item_variant}",
                                "textures": {
                                    "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                                }
                            })
                        variants.append({
                            "predicate": override['predicate'],
                            "model": f"gm4_metallurgy:item/shamir/{metal}/{item_variant}"
                        })
                    models.update({similar_item: variants})

                # fishing-rod-items
                if item == "fishing_rod":
                    for similar_item in ["carrot_on_a_stick", "warped_fungus_on_a_stick"]:
                        ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"] = Model({
                            "parent": f"minecraft:item/{similar_item}",
                            "textures": {
                                "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                            }
                        })
                        models.update({similar_item: f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"})


            elif item == "broken_elytra": # if broken elytra texture if provided, override the repaired elytra texture on the broken model
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/broken_elytra"] = Model({
                        "parent": f"minecraft:item/broken_elytra",
                        "textures": {
                            "layer1": f"gm4_metallurgy:item/shamir/{metal}/broken_elytra"
                        }
                    })
                
            # single-case items (trident, shears, flint-n-steel ect...) # NOTE trident and spyglass don't accept layers for textures. This is a quirk of vanilla
            elif item in SIMPLE_MODELS:
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{item}"] = Model({
                    "parent": f"minecraft:item/{item}",
                    "textures": {
                        "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                    }
                })
                models.update({item: f"item/shamir/{metal}/{item}"})
                
            elif item == "bucket":
                for similar_item in ["bucket", "water_bucket", "lava_bucket", "milk_bucket", "powder_snow_bucket", "cod_bucket", "salmon_bucket", "tropical_fish_bucket", "pufferfish_bucket", "axolotl_bucket", "tadpole_bucket"]:
                    ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"] = Model({
                        "parent": f"minecraft:item/{similar_item}",
                        "textures": {
                            "layer1": f"gm4_metallurgy:item/shamir/{metal}/bucket"
                        }
                    })
                    models.update({similar_item: f"item/shamir/{metal}/{similar_item}"})

            else:
                logger.warning(f"Metallurgy tool '{item}' has a texture but was not handled by the plugin logic. Add the corresponding logic to generate the appropiate models")
        
        # register all the items to recieve the same CMD and reference
        model_data_meta = ctx.meta["gm4"]["model_data"]

        model_data_meta.append({
            "item": list(models.keys()),
            "reference": f"item/shamir/{metal}",
            "model": models
        })
