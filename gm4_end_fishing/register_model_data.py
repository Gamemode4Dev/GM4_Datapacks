from beet import Context, Model
from itertools import product

MATERIALS = ["diamond", "iron", "netherite"]
ARMORS = ["helmet", "chestplate", "leggings", "boots"]
TOOLS = ["pickaxe", "shovel"]
ORES = ["diamond", "emerald", "gold_ingot", "iron_ingot"]

def beet_default(ctx: Context):
    """Registered repetitive model_data config options for fishable items"""
    model_data_reg = ctx.meta["gm4"].setdefault("model_data", [])
    for i in range(10,19+1):
        item_models: dict[str,str] = {}
        for material, armor in product(MATERIALS, ARMORS):
            ctx.assets.models[f"gm4_end_fishing:item/armor/{material}_{armor}_{i}"] = Model({
                "parent": "item/generated",
                "textures": {
                    "layer0": f"item/armor/{material}_{armor}_{i}"
                }
            })
            item_models.update({f"{material}_{armor}": f"item/armor/{material}_{armor}_{i}"})
        model_data_reg.append({
            "item": list(item_models.keys()),
            "model": item_models,
            "reference": f"item/armor_{i}"
        })

    for i in range(10,19+1):
        item_models = {}
        for material, tool in product(MATERIALS, TOOLS):
            ctx.assets.models[f"gm4_end_fishing:item/tools/{material}_{tool}_{i}"] = Model({
                "parent": "item/handheld",
                "textures": {
                    "layer0": f"item/tools/{material}_{tool}_{i}"
                }
            })
            item_models.update({f"{material}_{tool}": f"item/tools/{material}_{tool}_{i}"})
        model_data_reg.append({
            "item": list(item_models.keys()),
            "model": item_models,
            "reference": f"item/tools_{i}"
        })

    for i in range(10,29+1):
        item_models = {}
        for material in MATERIALS:
            # item models have custom tuning, and are specified in source
            item_models.update({f"{material}_sword": f"item/swords/{material}_sword_{i}"})
        model_data_reg.append({
            "item": list(item_models.keys()),
            "model": item_models,
            "reference": f"item/swords_{i}",
            "template": "custom"
        })

    for i in range(10,14+1):
        item_models = {}
        for material in ["diamond", "golden", "iron"]:
            ctx.assets.models[f"gm4_end_fishing:item/horse_armor/{material}_horse_armor_{i}"] = Model({
                "parent": f"{material}_horse_armor"
            })
            item_models.update({f"{material}_horse_armor": f"item/horse_armor/{material}_horse_armor_{i}"})
        model_data_reg.append({
            "item": list(item_models.keys()),
            "model": item_models,
            "reference": f"item/horse_armor_{i}",
        })

    for i in range(10,15+1):
        item_models = {}
        for ore in ORES:
            ctx.assets.models[f"gm4_end_fishing:item/ores/{ore}_{i}"] = Model({
                "parent": "item/generated",
                "textures":{
                    "layer0": f"item/ores/end_{ore}"
                }
            })
            item_models.update({ore: f"item/ores/{ore}_{i}"})
        model_data_reg.append({
            "item": ORES,
            "model": item_models,
            "reference": f"item/ore_{i}",
        })
