#@s = cow above liquid tank
#run from standard_liquids:util_above

scoreboard players add @s gm4_lt_util 1

#init empty tanks
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] if score @s gm4_lt_value matches 0 at @s if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Empty Tank\"}"} run function standard_liquids:liquid_init/milk

#add milk to tank
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] if score @s gm4_lt_value matches ..87 at @s if block ~ ~ ~ hopper{CustomName:"{\"text\":\"Milk Tank\"}"} run scoreboard players add @s gm4_lt_buffer 3

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
