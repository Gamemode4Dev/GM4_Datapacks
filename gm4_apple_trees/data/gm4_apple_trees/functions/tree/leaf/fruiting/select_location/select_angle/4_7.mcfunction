# selects starting angle for leaf in a binary search
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_apple_trees:tree/leaf/fruiting/select_location/position_apple_leaf

execute if score $angle gm4_apple_data matches 4..5 run function gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/4_5
execute if score $angle gm4_apple_data matches 6..7 run function gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/6_7
