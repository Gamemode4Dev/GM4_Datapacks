# initializes a TREE_TYPE leaf
# @s = a freshly generated TREE_TYPE sapling leaf
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/fruit/generate

# set first stage change timer
scoreboard players operation @s gm4_fruit_stage = #apple_fruit_stage_0_start gm4_gv_math_num

# set age
scoreboard players operation @s gm4_fruit_age = #apple_fruit_stage_2_start gm4_gv_math_num

# finalize armor stand data
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_apple_fruit_leaf","gm4_ripe_apple_fruit"]}
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_apple_fruit_leaf","gm4_ripe_apple_fruit"],HandItems:[{id:"minecraft:apple",Count:1b,tag:{display:{Name:'{"text":"Apple","italic":false}'}}},{}]}
loot replace entity @s weapon.mainhand loot gm4_garden_variety:items/fruit/apple
