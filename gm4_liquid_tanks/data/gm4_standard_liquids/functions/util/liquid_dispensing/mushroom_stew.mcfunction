#@s = living-base entity below mushroom stew tank
#run from standard_liquids:util_below

effect give @s saturation 1 5
scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
particle item white_terracotta ~0.5 ~1 ~0.5 0.2 0.2 0.2 0 20 normal @a[distance=..16]
