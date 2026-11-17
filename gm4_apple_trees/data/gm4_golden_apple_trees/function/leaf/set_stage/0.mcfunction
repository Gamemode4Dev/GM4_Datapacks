# sets this apple leaf's stage to 0 (final stage)
# @s = gm4_apple_leaf on stage 2 (big apple) which should drop its apple
# located at @s
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #gapple_stage_1_start gm4_apple_data

# reset age
scoreboard players operation @s gm4_fruit_age -= #gapple_stage_0_start gm4_apple_data

# visuals
execute unless entity @s[tag=gm4_skip_item_drop] positioned ^0.25 ^-0.7 ^ run function gm4_golden_apple_trees:leaf/apple/drop
item replace entity @s contents with minecraft:air
tag @s remove gm4_ripe_apple
tag @s remove gm4_skip_item_drop
tag @s remove gm4_apple_taken
