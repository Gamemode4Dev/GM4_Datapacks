# sets this apple leaf's stage to 1
# @s = gm4_apple item_display on stage 0 (no apple) which should get an unripe apple
# located at @s
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #gapple_stage_2_start gm4_apple_data

# visuals
playsound minecraft:block.beehive.drip block @a[distance=..8] ~ ~ ~ 0.3 1.4
item replace entity @s contents with minecraft:golden_apple[custom_model_data={"strings":["gm4_apple_trees:block/golden_apple_unripe"]}] 1
