#run from load_check
#@s = liquid minecart with a hopper pointing at it

#if the minecart has a liquid in it and the tank does too
execute if entity @s[scores={gm4_lt_value=1..}] if entity @e[type=armor_stand,distance=..0.1,tag=gm4_liquid_tank,scores={gm4_lt_value=1..}] if score @s gm4_lt_value < @s gm4_lt_max run function liquid_minecarts:compare_load_liquid
#if the minecart is empty and the tank has contents
execute if entity @s[tag=gm4_liquid_minecart_empty] if entity @e[type=armor_stand,distance=..0.1,tag=gm4_liquid_tank,scores={gm4_lt_value=1..}] run function liquid_minecarts:init_liquid
