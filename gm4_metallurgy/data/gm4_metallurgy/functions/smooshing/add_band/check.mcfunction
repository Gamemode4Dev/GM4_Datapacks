# @s = obsidian cast with a shamir on it
# called from smooshing/prepare_transfer

# prepare shamir if NBT needs to be updated from old version
data modify storage gm4_metallurgy:temp/item/band gm4_metallurgy set from entity @s Item.tag.gm4_metallurgy
execute if data storage gm4_metallurgy:temp/item/band gm4_metallurgy.ore_type run function gm4_metallurgy:smooshing/add_band/update_band_nbt_version
data modify entity @s Item.tag.gm4_metallurgy set from storage gm4_metallurgy:temp/item/band gm4_metallurgy
data remove storage gm4_metallurgy:temp/item/band gm4_metallurgy

# check whether the other item is valid
scoreboard players set valid_item gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt={Item:{Count:1b}},nbt=!{Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run function gm4_metallurgy:smooshing/add_band/check_item

execute if score valid_item gm4_ml_data matches 1 run data merge entity @s {Item:{id:"minecraft:obsidian",tag:{CustomModelData:1,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Slightly Damaged Obsidian",{"translate":"item.gm4.slightly_damaged_obsidian"}],"italic":false}']}}},Tags:["gm4_ml_smooshed"]}
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.tag.gm4_metallurgy
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.tag.SkullOwner
