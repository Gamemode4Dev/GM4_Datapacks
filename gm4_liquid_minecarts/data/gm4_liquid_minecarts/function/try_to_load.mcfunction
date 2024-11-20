#@s = liquid minecart with a hopper pointing at it
#run from liquid_minecarts:load_check

#if the minecart has a liquid in it and the tank does too
execute if entity @s[scores={gm4_lt_value=1..}] if entity @e[type=marker,distance=..0.1,tag=gm4_liquid_tank,tag=!gm4_volatile_liquid,scores={gm4_lt_value=1..}] if score @s gm4_lt_value < @s gm4_lt_max run function gm4_liquid_minecarts:compare_load_liquid

#if the minecart is empty and the tank has contents
execute if entity @s[tag=gm4_liquid_minecart_empty] if entity @e[type=marker,distance=..0.1,tag=gm4_liquid_tank,tag=!gm4_volatile_liquid,scores={gm4_lt_value=1..}] run function gm4_liquid_minecarts:init_liquid

#if the minecart is empty and the tank has volitile contents
execute if entity @s[tag=gm4_liquid_minecart_empty] if entity @e[type=marker,distance=..0.1,tag=gm4_liquid_tank,tag=gm4_volatile_liquid,scores={gm4_lt_value=1..}] run playsound minecraft:entity.generic.extinguish_fire block @a
