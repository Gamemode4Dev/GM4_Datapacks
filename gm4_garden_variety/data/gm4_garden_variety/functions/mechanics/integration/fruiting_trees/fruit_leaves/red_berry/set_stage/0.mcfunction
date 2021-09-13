# sets this fruit leaf's stage to 0 (final stage)
# @s = TREE_TYPE_fruit_leaf on stage 2 (big fruit) which should drop its fruit
# at @s align xyz
# run from gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #red_berry_fruit_stage_1_start gm4_gv_fruit

# reset age
scoreboard players reset @s gm4_fruit_age

# visuals
execute if data entity @s HandItems[0].id positioned ~0.5 ~1.5 ~0.5 run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/spawn_fruit
data merge entity @s {Marker:1b,HandItems:[],Small:1b,DisabledSlots:65854,Tags:["gm4_fruiting_leaf","gm4_red_berry_fruit_leaf"]}
tp @s ~0.5 ~1.05 ~0.5
