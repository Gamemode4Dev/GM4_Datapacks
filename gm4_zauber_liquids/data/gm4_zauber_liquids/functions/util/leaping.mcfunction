#@s = living-base entity below zauber leaping potion tank
#run from zauber_liquids:util_below

effect give @s jump_boost 90 3
scoreboard players remove @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
