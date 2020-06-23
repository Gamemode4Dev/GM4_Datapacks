#@s=endermen_deactivator_live armour stand
#from clock

#deactivation condition
execute unless score @s gm4_end_deact matches 0..750 run function gm4_endermen_deactivators:deactivate

#werk
particle minecraft:happy_villager ~ ~ ~ 45 20 45 1 250 force
execute as @e[type=minecraft:enderman,distance=..45] run data merge entity @s {carriedBlockState:{Name:bubble_column}}