#@s = living-base entity below glow ink tank
#run from standard_liquids:util_below

effect give @s glowing 60 0
effect give @s night_vision 90 0
scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
