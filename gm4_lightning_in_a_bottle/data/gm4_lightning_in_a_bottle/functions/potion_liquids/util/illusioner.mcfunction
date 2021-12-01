# @s = illusioner above liquid tank
# run from gm4_lightning_in_a_bottle:potion_liquids/util_above

scoreboard players add @s gm4_lt_util 1

#init empty tanks to random potion
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_empty,distance=..8] if score @s gm4_lt_value matches 0 at @s run function gm4_lightning_in_a_bottle:potion_liquids/util/random_illusioner_init

#add potion to tank
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_invisibility,distance=..8] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_value 1
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_blindness,distance=..8] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_value 1
execute if score @s gm4_lt_util matches 1 as @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,tag=gm4_lt_night_vision,distance=..8] if score @s gm4_lt_value matches ..29 run scoreboard players add @s gm4_lt_value 1

#reset score after 5 mins
execute if score @s gm4_lt_util matches 375.. run scoreboard players reset @s gm4_lt_util
