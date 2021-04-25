# @s = new band item
# run from smooshing/remove_band/found_obsidian

# Locate shamir lore
execute if data storage gm4_metallurgy:temp item_lore[0] run function gm4_metallurgy:smooshing/remove_band/get_shamir_lore

data modify entity @s Item.tag.display.Lore append from storage gm4_metallurgy:temp shamir_lore
data modify entity @s Item.tag.gm4_metallurgy.stored_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.active_shamir
data modify entity @s Item.tag.CustomModelData set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.custom_model_data