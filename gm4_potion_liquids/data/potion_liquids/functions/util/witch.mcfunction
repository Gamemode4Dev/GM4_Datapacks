#@s = witch above liquid tank
#run from potion_liquids:util_above

scoreboard players add @s gm4_lt_util 1

# do the filling
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] if score @s gm4_lt_value matches 0..299 at @s run function potion_liquids:util/witch_fill_tank

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
