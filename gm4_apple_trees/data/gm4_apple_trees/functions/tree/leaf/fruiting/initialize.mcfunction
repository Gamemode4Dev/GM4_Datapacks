# initializes an apple leaf
# @s = a freshly generated apple leaf
# at @s
# run from gm4_apple_trees:tree/leaf/fruiting/generate

# set first stage change timer
scoreboard players operation @s gm4_fruit_stage = #stage_0_start gm4_apple_data

# set age
scoreboard players operation @s gm4_fruit_age = #stage_2_start gm4_apple_data

# finalize armor stand data
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_apple_leaf","gm4_ripe_apple","gm4_no_edit"],HandItems:[{id:"minecraft:apple",Count:1b},{}]}
