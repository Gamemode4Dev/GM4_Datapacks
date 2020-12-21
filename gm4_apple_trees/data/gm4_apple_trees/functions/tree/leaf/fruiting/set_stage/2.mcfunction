# sets this apple leaf's stage to 2
# @s = gm4_apple_leaf on stage 1 (small apple) which should drop its apple
# at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_0_start gm4_apple_data

# visuals
data merge entity @s {Small:0b,HandItems:[{id:"minecraft:apple",Count:1},{}],ArmorItems:[]}
