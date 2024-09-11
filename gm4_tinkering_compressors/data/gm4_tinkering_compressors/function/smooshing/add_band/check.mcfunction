# @s = obsidian cast with a shamir on it
# called from smooshing/prepare_transfer

# prepare shamir if NBT needs to be updated from old version
function gm4_metallurgy:update_nbt_version/load_band

# check whether the other item is a compressor
scoreboard players set valid_item gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt={Item:{count:1,components:{"minecraft:custom_data":{gm4_machines:{id:"block_compressor"}}}}}] run function gm4_tinkering_compressors:smooshing/add_band/convert_to_tinkering_compressor

execute if score valid_item gm4_ml_data matches 1 run item modify entity @s contents gm4_tinkering_compressors:slightly_damaged_obsidian
execute if score valid_item gm4_ml_data matches 1 run tag @s add gm4_ml_smooshed
