# initializes a TREE_TYPE leaf
# @s = a freshly generated TREE_TYPE sapling leaf
# run from gm4_garden_variety_trees:trees/TREE_TYPE/fruiting/leaf/fruit/generate

# set first stage change timer
scoreboard players operation @s gm4_fruit_stage = #red_berry_fruit_stage_0_start gm4_gv_math_num

# set age
scoreboard players operation @s gm4_fruit_age = #red_berry_fruit_stage_2_start gm4_gv_math_num

# finalize armor stand data
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_red_berry_fruit_leaf","gm4_ripe_red_berry_fruit"]}
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_red_berry_fruit_leaf","gm4_ripe_red_berry_fruit"],HandItems:[{id:"minecraft:sweet_berries",Count:1b,tag:{display:{Name:'{"text":"King Palm Fruit","italic":false}'}}},{}]}
loot replace entity @s weapon.mainhand loot gm4_garden_variety:items/fruit/red_berry
