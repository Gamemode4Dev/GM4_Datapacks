#@s = living-base entity below turtle_master potion tank
#run from potion_liquids:util_below

effect give @s slowness 20 3
effect give @s resistance 20 2
scoreboard players remove @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_buffer 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
