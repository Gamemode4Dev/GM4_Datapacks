# initializes an apple leaf
# @s = a freshly generated apple leaf
# at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/generate

# set first stage change timer
scoreboard players operation @s gm4_fruit_stage = #stage_0_start gm4_apple_data

# set age
scoreboard players operation @s gm4_fruit_age = #stage_2_start gm4_apple_data

#remove new tag
tag @s remove gm4_fruiting_leaf_new
