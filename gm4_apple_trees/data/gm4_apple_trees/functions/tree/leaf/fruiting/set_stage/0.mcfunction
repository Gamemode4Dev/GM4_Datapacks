# sets this apple leaf's stage to 0 (final stage)
# @s = gm4_apple_leaf on stage 2 (big apple) which should drop its apple
# at @s
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_1_start gm4_apple_data

# reset age
scoreboard players reset @s gm4_fruit_age

# visuals
data merge entity @s {HandItems:[],ArmorItems:[]}
summon item ~ ~1.6 ~ {Age:5940,PickupDelay:32767,Item:{id:"minecraft:cooked_porkchop",Count:1b}}
