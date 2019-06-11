# @s = tank to where a witch is adding some potion
# run from potion_liquids:util/witch


#init empty tanks to random potion
execute if entity @s[tag=gm4_lt_empty] if score @s gm4_lt_value matches 0 at @s run function potion_liquids:util/random_witch_init

#add potion to tank
execute if entity @s[tag=gm4_lt_regeneration] run scoreboard players add @s gm4_lt_buffer 1
execute if entity @s[tag=gm4_lt_swiftness] run scoreboard players add @s gm4_lt_buffer 1
execute if entity @s[tag=gm4_lt_fire_resistance] run scoreboard players add @s gm4_lt_buffer 1
execute if entity @s[tag=gm4_lt_harming] run scoreboard players add @s gm4_lt_buffer 1
