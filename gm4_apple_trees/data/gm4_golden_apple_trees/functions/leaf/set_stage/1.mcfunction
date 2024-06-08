# sets this apple leaf's stage to 1
# @s = gm4_apple_leaf on stage 0 (no apple) which should drop its apple
# located at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #gapple_stage_2_start gm4_apple_data

# visuals
playsound minecraft:block.beehive.drip block @a[distance=..8] ~ ~ ~ 0.3 1.4
data merge entity @s {Marker:0b,ShowArms:1b,HandItems:[{},{id:"minecraft:golden_apple",count:1,components:{"minecraft:custom_model_data":"block/golden_apple_unripe"}}],Pose:{LeftArm:[0.0f,90.0f,90.0f]}}
