from beet import Context, Model, Texture
from beet.contrib.vanilla import Vanilla
from typing import Any
import logging

TOOL_MATERIALS = ["wooden", "stone", "iron", "golden", "diamond", "netherite"]
ARMOR_MATERIALS = ["leather", "chainmail", "iron", "golden", "diamond"]
METALS = ["aluminium", "barimium", "barium", "bismuth", "curies_bismium", "thorium"]
TOOLS = ["axe", "hoe", "pickaxe", "shovel", "sword"]
ARMOR = ["boots", "chestplate", "helmet", "leggings"]
SPECIAL_ARMOR = ["helmet_netherite", "leggings_leather"]
PREDICATED_MODELS = ["elytra", "compass", "fishing_rod", "bow", "crossbow", "clock"]
SIMPLE_MODELS = ["trident", "flint_and_steel", "shears", "spyglass"]

MATERIALS_SWITCH = {k:TOOL_MATERIALS for k in TOOLS}|{k:ARMOR_MATERIALS for k in ARMOR}

#TODO handle the recovery compass too

logger = logging.getLogger(__name__)

def beet_default(ctx: Context):
    texture_tree = ctx.assets["gm4_metallurgy"].textures.generate_tree()
    model_data_meta = ctx.meta["gm4"]["model_data"]
    vanilla = ctx.inject(Vanilla)
    vanilla_models_jar = vanilla.mount("assets/minecraft/models/item")
    
    for metal in METALS:
        for item in texture_tree["item"]["shamir"][metal].values():
            # material variants of tools/armor # TODO armor trim variants
            if item in TOOLS+ARMOR:
                for material in MATERIALS_SWITCH[item]:
                    if (n:=f"gm4_metallurgy:item/shamir/{metal}/{material}_{item}") not in ctx.assets.models:
                        ctx.assets.models[n] = Model({
                            "parent": f"minecraft:item/{material}_{item}",
                            "textures": {
                                f"layer{2+(material=='leather')}": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                            }
                        })
                    model_data_meta.append({
                        "item": f"{material}_{item}",
                        "reference": f"item/shamir/{metal}/{material}_{item}"
                    })

            elif item in SPECIAL_ARMOR:
                # mutate model-file
                tool, material = item.split("_")
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{material}_{tool}"] = Model({
                        "parent": f"minecraft:item/{material}_{tool}",
                        "textures": {
                            f"layer{2+(material=='leather')}": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                        }
                    }) # TODO this cannot be tested yet, armor models be broken
            
            elif item == "helmet_turtle":
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/turtle_helmet"] = Model({
                    "parent": f"minecraft:item/turtle_helmet",
                    "textures": {
                        "layer1": f"gm4_metallurgy:item/shamir/{metal}/helmet_turtle"
                    }
                })
                model_data_meta.append({
                    "item": "turtle_helmet",
                    "reference": f"gm4_metallurgy:item/shamir/{metal}/turtle_helmet"
                })

            # items with predicate model variants
            elif item in PREDICATED_MODELS: # TODO Compass_null?
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{item}"] = Model({
                    "parent": f"minecraft:item/{item}",
                    "textures": {
                        "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                    }
                })
                variants: Any = [{"model": f"gm4_metallurgy:item/shamir/{metal}/{item}"}] # the base model has no predicate to match
                for override in vanilla_models_jar.assets.models[f"minecraft:item/{item}"].data['overrides']:
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
                model_data_meta.append({
                    "item": item,
                    "reference": f"item/shamir/{metal}/{item}",
                    "model": variants
                })

                # fishing-rod-items
                if item == "fishing_rod":
                    for similar_item in ["carrot_on_a_stick", "warped_fungus_on_a_stick"]:
                        ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"] = Model({
                            "parent": f"minecraft:item/{similar_item}",
                            "textures": {
                                "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                            }
                        })
                        ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}_cast"] = Model({
                            "parent": f"minecraft:item/{similar_item}_cast",
                            "textures": {
                                "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                            }
                        })
                        model_data_meta.append({
                            "item": similar_item,
                            "reference": f"item/shamir/{metal}/{similar_item}",
                            "model": [
                                {"model": f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"},
                                {"predicate": {"cast": 1},
                                 "model": f"gm4_metallurgy:item/shamir/{metal}/{similar_item}_cast"
                                }
                            ]
                        })


            elif item == "broken_elytra": # if broken elytra texture if provided, override the repaired elytra texture on the broken model
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/broken_elytra"] = Model({
                        "parent": f"minecraft:item/broken_elytra",
                        "textures": {
                            "layer1": f"gm4_metallurgy:item/shamir/{metal}/broken_elytra"
                        }
                    })
                
            # single-case items (trident, shears, flint-n-steel ect...) # FIXME trident and spyglass don't accept layers for textures... 
            elif item in SIMPLE_MODELS:
                ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{item}"] = Model({
                    # "parent": f"minecraft:item/{item}",
                    "parent": f"minecraft:item/apple",
                    "textures": {
                        "layer1": f"gm4_metallurgy:item/shamir/{metal}/{item}"
                    }
                })
                model_data_meta.append({
                        "item": item,
                        "reference": f"item/shamir/{metal}/{item}"
                    })
                
            elif item == "bucket":
                for similar_item in ["bucket", "water_bucket", "lava_bucket", "milk_bucket", "powder_snow_bucket"]:
                    ctx.assets.models[f"gm4_metallurgy:item/shamir/{metal}/{similar_item}"] = Model({
                        "parent": f"minecraft:{similar_item}",
                        "textures": {
                            "layer1": f"gm4_metallurgy:item/shamir/{metal}/bucket"
                        }
                    })
                    model_data_meta.append({
                        "item": similar_item,
                        "reference": f"item/shamir/{metal}/{similar_item}"
                    })


            else:
                logger.warning(f"Metallurgy tool '{item}' has a texture but was not handled by the plugin logic. Add the corresponding logic to generate the appropiate models")
