# generates the red berry leaf
# @s = @e[type=armor_stand,tag=gm4_fruiting_leaf_new]
# at @s
# run from gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/generate


# set first stage change timer
scoreboard players operation @s gm4_fruit_stage = #red_berry_fruit_stage_0_start gm4_gv_fruit

# set age
scoreboard players operation @s gm4_fruit_age = #red_berry_fruit_stage_2_start gm4_gv_fruit

# finalize armor stand data
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_red_berry_fruit_leaf","gm4_ripe_red_berry_fruit"]}
data merge entity @s {Tags:["gm4_fruiting_leaf","gm4_red_berry_fruit_leaf","gm4_ripe_red_berry_fruit"],HandItems:[{id:"minecraft:sweet_berries",Count:1b,tag:{display:{Name:'{"text":"King Palm Fruit","italic":false}'}}},{}]}
loot replace entity @s weapon.mainhand loot gm4_garden_variety:items/fruit/red_berry
