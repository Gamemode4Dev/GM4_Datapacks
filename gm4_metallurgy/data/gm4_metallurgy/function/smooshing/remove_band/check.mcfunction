# @s = item being crushed by a piston that has a shamir
# run from smooshing/prepare_transfer

#check whether the other item is an obsidian block
scoreboard players set $valid_obsidian gm4_ml_data 0
execute if entity @e[type=item,dx=0,predicate=gm4_metallurgy:is_obsidian,limit=1] run function gm4_metallurgy:smooshing/remove_band/found_obsidian

#if both custom model data tags are the same, then we can delete it
execute store success score custom_model_data gm4_ml_data run data modify entity @s Item.components."minecraft:custom_data".gm4_metallurgy.custom_model_data set from entity @s Item.components."minecraft:custom_model_data"
execute if score $valid_obsidian gm4_ml_data matches 1 run function gm4_metallurgy:smooshing/remove_band/clear_data
