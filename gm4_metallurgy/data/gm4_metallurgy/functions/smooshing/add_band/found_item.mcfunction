# @s = item to receive the shamir
# @e[tag=gm4_ml_source] = shamir item
# called from smooshing/add_band/check_item

# apply the shamir to the item, copying its tags in the process
data merge entity @s {Tags:["gm4_ml_smooshed"],Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}
data modify entity @s Item.tag.gm4_metallurgy.active_shamir set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.stored_shamir
data modify entity @s Item.tag.gm4_metallurgy.metal.type set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.gm4_metallurgy.metal.type
data modify entity @s Item.tag.display.Lore set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.display.Lore
execute as @e[type=item,tag=gm4_ml_source,dx=0,limit=1] if data entity @s Item.tag.gm4_metallurgy.custom_model_data run data modify entity @s Item.tag.CustomModelData set from entity @s Item.tag.gm4_metallurgy.custom_model_data
data modify entity @s Item.tag.gm4_metallurgy.custom_model_data set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.CustomModelData
execute unless data entity @s Item.tag.CustomModelData run data modify entity @s Item.tag.CustomModelData set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.CustomModelData
function #gm4_metallurgy:apply_band

# copy SkullOwner.Name to the new item (which is copied back to the obsidian cast when unsmooshed)
# legacy shamirs do not have this tag: invoke #update_skull_owner to migrate legacy shamirs to the new format
data remove storage gm4_metallurgy:temp/shamir skull_owner
data modify storage gm4_metallurgy:temp/shamir skull_owner set from entity @e[type=item,tag=gm4_ml_source,dx=0,limit=1] Item.tag.SkullOwner.Name
execute unless data storage gm4_metallurgy:temp/shamir skull_owner run data modify storage gm4_metallurgy:temp/shamir name set from entity @s Item.tag.gm4_metallurgy.active_shamir
execute unless data storage gm4_metallurgy:temp/shamir skull_owner run function #gm4_metallurgy:update_skull_owner
data modify entity @s Item.tag.gm4_metallurgy.skull_owner set from storage gm4_metallurgy:temp/shamir skull_owner

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
