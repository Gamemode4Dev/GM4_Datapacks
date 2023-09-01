from beet import Context
from itertools import product

MATERIALS = ["diamond", "iron", "netherite"]
ARMORS = ["helmet", "chestplate", "leggings", "boots"]
TOOLS = ["pickaxe", "shovel"]
ORES = ["diamond", "emerald", "gold_ingot", "iron_ingot"]

def beet_default(ctx: Context):
    """Registered repetitive model_data config options for fishable items"""
    model_data_reg = ctx.meta["gm4"].setdefault("model_data", [])
    for material, armor in product(MATERIALS, ARMORS):
        for i in range(10,19+1):
            model_data_reg.append({
                "item": f"{material}_{armor}",
                "reference": f"item/armor/{material}_{armor}_{i}",
                "template": "generated"
            })

    for material, tool in product(MATERIALS, TOOLS):
        for i in range(10,19+1):
            model_data_reg.append({
                "item": f"{material}_{tool}",
                "reference": f"item/tools/{material}_{tool}_{i}",
                "template": "generated"
            })

    for material in MATERIALS:
        for i in range(10,29+1):
            model_data_reg.append({
                "item": f"{material}_sword",
                "reference": f"item/swords/{material}_sword_{i}",
                "template": "generated"
            })

    for material in ["diamond", "golden", "iron"]:
        for i in range(10,14+1):
            model_data_reg.append({
                "item": f"{material}_horse_armor",
                "reference": f"item/horse_armor/{material}_horse_armor_{i}",
                "template": "vanilla"
            })

    for ore in ORES:
        for i in range(10,14+1):
            model_data_reg.append({
                "item": ore,
                "reference": f"item/ores/{ore}_{i}",
                "template": "generated",
                "textures": f"item/ores/end_{ore}"
            })