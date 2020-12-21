# sets this apple leaf's stage to 0 (final stage)
# @s = gm4_apple_leaf on stage 2 (big apple) which should drop its apple
# at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_1_start gm4_apple_data

# reset age
scoreboard players reset @s gm4_fruit_age

# visuals
execute if data entity @s HandItems[0].id positioned ~0.5 ~1.5 ~0.5 run function gm4_apple_trees:tree/leaf/fruiting/spawn_apple
data merge entity @s {Marker:1b,HandItems:[],Small:1b,DisabledSlots:65854,Tags:["gm4_fruiting_leaf","gm4_apple_leaf"]}
tp @s ~0.5 ~1.05 ~0.5
