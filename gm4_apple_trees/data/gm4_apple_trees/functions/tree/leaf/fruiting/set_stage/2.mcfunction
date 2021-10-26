# sets this apple leaf's stage to 2
# @s = gm4_apple_leaf on stage 1 (small apple) which should drop its apple
# at @s align xyz
# run from gm4_apple_trees:tree/leaf/fruiting/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #stage_0_start gm4_apple_data

# visuals
playsound minecraft:block.beehive.drip block @a[distance=..8] ~ ~ ~ 0.3 1.4
data merge entity @s {HandItems:[{id:"minecraft:apple",Count:1b},{}],Small:0b,DisabledSlots:62,Tags:["gm4_fruiting_leaf","gm4_apple_leaf","gm4_ripe_apple"]}
tp @s ~0.5 ~-0.9 ~0.5
