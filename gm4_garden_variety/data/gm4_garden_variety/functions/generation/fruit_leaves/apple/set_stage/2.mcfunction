# sets this fruit leaf's stage to 2
# @s = TREE_TYPE_fruit_leaf on stage 1 (small fruit) which should drop its fruit
# at @s align xyz
# run from gm4_natural_trees:trees/TREE_TYPE/fruiting/leaf/fruit/advance_stage

# set leaf's next stage change age
scoreboard players operation @s gm4_fruit_stage = #apple_fruit_stage_0_start gm4_gv_math_num

# visuals
playsound minecraft:block.beehive.drip block @a[distance=..8] ~ ~ ~ 0.3 1.4
data merge entity @s {HandItems:[{id:"minecraft:apple",Count:1b,tag:{display:{Name:'{"text":"Apple","italic":false}'}}},{}],Small:0b,DisabledSlots:65598,Tags:["gm4_fruiting_leaf","gm4_apple_fruit_leaf","gm4_ripe_apple_fruit"]}
tp @s ~0.5 ~-0.9 ~0.5