#@s = living-base entity below strong regeneration potion tank
#run from potion_liquids:util_below

effect give @s regeneration 22 1
scoreboard players remove @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
