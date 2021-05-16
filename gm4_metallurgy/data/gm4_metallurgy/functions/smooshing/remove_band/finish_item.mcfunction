# @s = new band item
# run from smooshing/remove_band/found_obsidian

data modify entity @s Item.tag.display.Lore append from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore[-1]
data modify entity @s Item.tag.gm4_metallurgy.stored_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.active_shamir
data modify entity @s Item.tag.CustomModelData set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.custom_model_data

data remove storage gm4_metallurgy:temp/shamir skull_owner
data modify storage gm4_metallurgy:temp/shamir skull_owner set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.skull_owner
execute unless data storage gm4_metallurgy:temp/shamir skull_owner run data modify storage gm4_metallurgy:temp/shamir name set from entity @s Item.tag.gm4_metallurgy.stored_shamir
execute unless data storage gm4_metallurgy:temp/shamir skull_owner run function #gm4_metallurgy:update_skull_owner
data modify entity @s Item.tag.SkullOwner.Name set from storage gm4_metallurgy:temp/shamir skull_owner
