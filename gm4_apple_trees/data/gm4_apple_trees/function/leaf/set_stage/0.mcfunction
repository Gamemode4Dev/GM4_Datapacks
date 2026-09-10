# sets this apple leaf's stage to 0 (final stage)
# @s = gm4_apple item_display on stage 2 (big apple) which should drop its apple
# located at @s
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_1_start gm4_apple_data

# reset age
scoreboard players operation @s gm4_fruit_age -= #stage_0_start gm4_apple_data

# visuals
execute unless entity @s[tag=gm4_skip_item_drop] positioned ^0.25 ^-0.7 ^ run function gm4_apple_trees:leaf/apple/drop
item replace entity @s contents with minecraft:air
tag @s remove gm4_ripe_apple
tag @s remove gm4_skip_item_drop
tag @s remove gm4_apple_taken

#apple transformation data for reference
# transformation:{right_rotation:{angle:1.57,axis:[0f,1f,0f]},scale:[0.55f,0.55f,0.55f],left_rotation:{axis:[0,0,0],angle:0},translation:[0.25,-0.71,-0.06]}}
