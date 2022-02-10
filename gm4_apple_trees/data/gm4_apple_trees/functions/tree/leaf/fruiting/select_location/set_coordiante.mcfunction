# creates refrence frame for apple placement and recurses fr future apple placement
# @s = sapling marker
# positioned ~ ~n ~ above the marker rotated as @s
# run from gm4_apple_trees:tree/leaf/fruiting/select_location/set_coordinate

# set starting angle angle (binary search tree)
execute if score $angle gm4_apple_data matches 0..3 run function gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/0_3
execute if score $angle gm4_apple_data matches 4..7 run function gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/4_7

# try to place leaf at coordintes
execute if score $radius gm4_apple_data matches 0 rotated as @s positioned ^ ^ ^1 run function gm4_apple_trees:tree/leaf/fruiting/select_location/check_leaf_validity
execute if score $radius gm4_apple_data matches 1 rotated as @s positioned ^ ^ ^2 run function gm4_apple_trees:tree/leaf/fruiting/select_location/check_leaf_validity

# continue placing apple leaves until it exceeds the max failed attempts
scoreboard players add $apple_attempts gm4_apple_data 1
execute unless score $failed_apple_attempts gm4_apple_data >= #max_failed_apple_attempts gm4_apple_data unless score $apple_attempts gm4_apple_data >= #max_apple_attempts gm4_apple_data run function gm4_apple_trees:tree/leaf/fruiting/select_location/set_coordiante
