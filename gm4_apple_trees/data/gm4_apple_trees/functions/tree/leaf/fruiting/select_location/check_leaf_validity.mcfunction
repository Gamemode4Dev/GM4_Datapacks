# positions the apple leaf
# @s = sapling marker
# at selected coordinate for leaf
# run from gm4_apple_trees:tree/leaf/fruiting/select_location/set_coordinates

# place apple leaf, if there is a leaf above and the block itself is #gm4_fruiting_trees:tree_replaceable and there is no apple in this blockspace
scoreboard players set $created_apple_leaf gm4_apple_data 0
execute store success score $created_apple_leaf gm4_apple_data align xyz if block ~ ~1 ~ minecraft:oak_leaves[persistent=false] if block ~ ~ ~ #gm4_fruiting_trees:tree_replaceable unless entity @e[type=armor_stand,tag=gm4_apple_leaf,dx=0,limit=1] run function gm4_apple_trees:tree/leaf/fruiting/generate

# if placing failed, flip $angle_change. if placing was successful, flip $radius_new
execute unless score $created_apple_leaf gm4_apple_data matches 1 store success score $angle_change gm4_apple_data if score $angle_change gm4_apple_data matches 0
execute if score $created_apple_leaf gm4_apple_data matches 1 store success score $radius_new gm4_apple_data if score $radius_new gm4_apple_data matches 0

# if $angle_change == 0, clockwise; else counterclockwise
execute if score $angle_change gm4_apple_data matches 0 run scoreboard players add $angle gm4_apple_data 1
execute if score $angle_change gm4_apple_data matches 1 run scoreboard players add $angle gm4_apple_data 2
scoreboard players operation $angle gm4_apple_data %= #8 gm4_apple_data

# set $radius to $radius_new
scoreboard players operation $radius gm4_apple_data = $radius_new gm4_apple_data

# count failed attempts
execute unless score $created_apple_leaf gm4_apple_data matches 1 run scoreboard players add $failed_apple_attempts gm4_apple_data 1
