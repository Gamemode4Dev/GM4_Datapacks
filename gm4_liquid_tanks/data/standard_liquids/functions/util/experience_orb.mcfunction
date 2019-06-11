#@s = xp-orb above liquid tank
#run from standard_liquids:util_above

#get xp orb's value
execute store result score experience_value gm4_lt_util run data get entity @s Value

scoreboard players operation @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_value += experience_value gm4_lt_util

kill @s
