# @s = new band item
# run from smooshing/remove_band/found_obsidian

data modify entity @s Item.tag.display.Lore append from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore[-1]
data modify entity @s Item.tag.gm4_metallurgy.stored_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.active_shamir
data modify entity @s Item.tag.gm4_metallurgy.custom_model_data set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.custom_model_data
data modify entity @s Item.tag.CustomModelData set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.custom_model_data
