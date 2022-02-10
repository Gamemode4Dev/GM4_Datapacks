# selects starting angle for leaf in a binary search
# @s = sapling marker
# positioned ~ ~n ~ above the marker rotated as @s
# run from gm4_apple_trees:tree/leaf/fruiting/select_location/select_angle/0_3

execute if score $angle gm4_apple_data matches 0 run tp @s ~ ~ ~ 0 0
execute if score $angle gm4_apple_data matches 1 run tp @s ~ ~ ~ 45 0
