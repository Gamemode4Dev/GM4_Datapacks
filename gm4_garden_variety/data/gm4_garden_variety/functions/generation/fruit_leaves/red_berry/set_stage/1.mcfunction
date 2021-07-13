# sets this fruit leaf's stage to 1
# @s = TREE_TYPE_fruit_leaf on stage 0 (no fruit) which should drop its fruit
# at @s align xyz
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/fruit/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #red_berry_fruit_stage_2_start gm4_gv_math_num

# visuals
playsound minecraft:block.beehive.drip block @a[distance=..8] ~ ~ ~ 0.3 1.4
data merge entity @s {Marker:0b,HandItems:[{id:"minecraft:sweet_berries",Count:1b,tag:{CustomModelData:1}},{}]}
