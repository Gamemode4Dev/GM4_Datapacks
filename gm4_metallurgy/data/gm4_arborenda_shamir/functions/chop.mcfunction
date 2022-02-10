# @s = player that just used an axe with arborenda
# run from main

scoreboard players set success gm4_ml_data 0

execute as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s}] at @s run function gm4_arborenda_shamir:check_item

scoreboard players set chop_count gm4_ml_data -1
scoreboard players set current_depth gm4_ml_data 0
execute if score success gm4_ml_data matches 1 run function gm4_arborenda_shamir:next_depth
execute if score chop_count gm4_ml_data matches 1.. run function gm4_arborenda_shamir:modify_axe_durability
execute if score chop_count gm4_ml_data matches 1.. run schedule function gm4_arborenda_shamir:destroy_trunk 2t
