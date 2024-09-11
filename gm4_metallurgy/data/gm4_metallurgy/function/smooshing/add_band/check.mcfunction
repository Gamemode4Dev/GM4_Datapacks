# @s = obsidian cast with a shamir on it
# called from smooshing/prepare_transfer

# check whether the other item is valid
scoreboard players set valid_item gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,predicate=gm4_metallurgy:smooshing/valid_item] run function gm4_metallurgy:smooshing/add_band/check_item

execute if score valid_item gm4_ml_data matches 1 run data merge entity @s {Item:{id:"minecraft:obsidian"},Tags:["gm4_ml_smooshed"]}
execute if score valid_item gm4_ml_data matches 1 run item modify entity @s contents gm4_metallurgy:slightly_damaged_obsidian
execute if score valid_item gm4_ml_data matches 1 run data remove entity @s Item.components."minecraft:custom_data".gm4_metallurgy
