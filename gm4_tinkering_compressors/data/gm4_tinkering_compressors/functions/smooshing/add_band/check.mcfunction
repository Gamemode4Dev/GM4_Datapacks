# @s = obsidian cast with a shamir on it
# called from smooshing/prepare_transfer

# prepare shamir if NBT needs to be updated from old version
function gm4_metallurgy:update_nbt_version/load_band

# check whether the other item is a compressor
scoreboard players set valid_item gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_machines:{id:"block_compressor"}}}}] run function gm4_tinkering_compressors:smooshing/add_band/convert_to_tinkering_compressor

execute if score valid_item gm4_ml_data matches 1 run data merge entity @s {Item:{id:"minecraft:obsidian",tag:{CustomModelData:3420001,display:{Lore:['{"translate":"item.gm4.slightly_damaged_obsidian","fallback":"Slightly Damaged Obsidian","color":"dark_gray"}']}}},Tags:["gm4_ml_smooshed"]}
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.tag.display.Name
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.tag.gm4_metallurgy
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.tag.SkullOwner
