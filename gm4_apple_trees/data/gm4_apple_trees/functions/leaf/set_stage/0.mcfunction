# sets this apple leaf's stage to 0 (final stage)
# @s = gm4_apple_leaf on stage 2 (big apple) which should drop its apple
# located at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_1_start gm4_apple_data

# reset age
scoreboard players operation @s gm4_fruit_age -= #stage_0_start gm4_apple_data

# visuals
execute if predicate gm4_apple_trees:apple_holding positioned ~0.5 ~1.5 ~0.5 positioned ^-.25 ^ ^.1 run function gm4_apple_trees:leaf/apple/drop
data merge entity @s {Marker:1b,HandItems:[],ShowArms:1b,Small:1b,DisabledSlots:2171166,Tags:["gm4_no_edit","gm4_apple","smithed.entity","smithed.strict"]}
tp @s ~0.5 ~1.05 ~0.5
