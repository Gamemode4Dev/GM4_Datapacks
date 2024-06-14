#@s = living-base entity below zauber regeneration potion tank
#run from zauber_liquids:util_below

effect give @s regeneration 22 3
effect give @s speed 16 2
scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
