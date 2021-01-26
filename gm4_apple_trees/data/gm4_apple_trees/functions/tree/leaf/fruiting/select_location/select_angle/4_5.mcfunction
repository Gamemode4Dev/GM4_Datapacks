# selects starting angle for leaf in a binary search
# @s = sapling marker area_effect_cloud
# positioned ~ ~n ~ above the AEC rotated as @s
# run from gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/4_7

execute if score $angle gm4_apple_data matches 4 run tp @s ~ ~ ~ 270 0
execute if score $angle gm4_apple_data matches 5 run tp @s ~ ~ ~ 300 0
