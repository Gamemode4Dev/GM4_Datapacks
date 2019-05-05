#@s = cow above liquid tank
#run from standard_liquids:util_above

scoreboard players add @s gm4_lt_util 1

#init empty tanks
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_empty] if score @s gm4_lt_value matches 0 at @s run function standard_liquids:liquid_init/milk

#add milk to tank
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_milk] if score @s gm4_lt_value matches ..297 run scoreboard players add @s gm4_lt_buffer 3

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
