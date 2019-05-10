#run from load_check
#@s = liquid minecart with a hopper below it

#if the minecart has a liquid in it and the tank does too
execute if entity @s[scores={gm4_lt_value=1..}] if entity @e[type=armor_stand,distance=..0.1,tag=gm4_liquid_tank,scores={gm4_lt_value=1..}] align xyz positioned ~.5 ~ ~.5 run function liquid_minecarts:compare_unload_liquid
#if the minecart has liquid but the tank is empty
execute if entity @s[scores={gm4_lt_value=1..}] if entity @e[type=armor_stand,distance=..0.1,tag=gm4_liquid_tank,scores={gm4_lt_value=0}] align xyz positioned ~.5 ~ ~.5 run function liquid_minecarts:init_tank
