from beet import Context
from beet.contrib.optifine import OptifineProperties
from itertools import product

def beet_default(ctx: Context):
    """generates the .properties files needed for optifine retextured armor"""

    for material, i, part in product(["diamond", "iron", "netherite"], range(1,10+1), ["boots", "leggings", "chestplate", "helmet"]):
        ctx.assets[OptifineProperties][f"gm4_end_fishing:cit/{material}_{part}_{i}"] = OptifineProperties("\n".join([
        "type=armor",
        f"matchItems={material}_{part}",
        f"texture.{material}_layer_{1+(part=='leggings')}={material}_{i}_layer_{1+(part=='leggings')}",
        f"nbt.CustomModelData=$item/end_city_armor_{i}"
        ]))