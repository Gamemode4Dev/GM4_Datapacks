#@s = living-base entity below milk tank
#run from standard_liquids:util_below

effect clear @s
scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] gm4_lt_value 3
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
particle item snow ~0.5 ~1 ~0.5 0.2 0.2 0.2 0 20 normal @a[distance=..16]
