#@s = witch above liquid tank
#run from potion_liquids:util_above

scoreboard players add @s gm4_lt_util 1

#init empty tanks to random potion
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_empty] if score @s gm4_lt_value matches 0 at @s run function potion_liquids:util/random_witch_init

#add potion to tank
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_regeneration] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_buffer 1
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_swiftness] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_buffer 1
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_fire_resistance] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_buffer 1
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_harming] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_buffer 1

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
