#@s = shulker above liquid tank
#run from potion_liquids:util_above

scoreboard players add @s gm4_lt_util 1

#init empty tanks
execute if score @s gm4_lt_util matches 1 as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_empty,distance=..8] if score @s gm4_lt_value matches 0 at @s run function gm4_potion_liquids:liquid_init/floating

#add potion to tank
execute if score @s gm4_lt_util matches 1 as @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_floating,distance=..8] if score @s gm4_lt_value matches ..299 run scoreboard players add @s gm4_lt_value 1

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
