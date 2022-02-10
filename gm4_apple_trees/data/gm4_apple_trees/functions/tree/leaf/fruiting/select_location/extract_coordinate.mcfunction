# marks leaves as fruiting leaves
# @s = sapling marker
# positioned ~ ~n ~ above the marker rotated as @s
# run from gm4_apple_trees:tree/layer/generate

# interpret bit 08 as radius and bits 09, 10, 11 as angles 0 to 7
scoreboard players operation $radius gm4_apple_data = $bit8 gm4_tree_seed
scoreboard players set $angle gm4_apple_data 0
execute if score $bit9 gm4_tree_seed matches 1 run scoreboard players add $angle gm4_apple_data 1
execute if score $bit10 gm4_tree_seed matches 1 run scoreboard players add $angle gm4_apple_data 2
execute if score $bit11 gm4_tree_seed matches 1 run scoreboard players add $angle gm4_apple_data 4

# interpret bit 12, 13 as new radius and angle change
scoreboard players operation $radius_new gm4_apple_data = $bit12 gm4_tree_seed
scoreboard players operation $angle_change gm4_apple_data = $bit13 gm4_tree_seed

# go to extracted coordinates
scoreboard players set $apple_attempts gm4_apple_data 0
scoreboard players set $failed_apple_attempts gm4_apple_data 0
function gm4_apple_trees:tree/leaf/fruiting/select_location/set_coordiante
