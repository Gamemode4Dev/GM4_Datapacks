#run from seasons:general/clock_second


execute at @a if entity @e[type=cow,distance=..32] as @e[type=cow,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=pig,distance=..32] as @e[type=pig,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=sheep,distance=..32] as @e[type=sheep,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=chicken,distance=..32] as @e[type=chicken,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=rabbit,distance=..32] as @e[type=rabbit,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=mooshroom,distance=..32] as @e[type=mooshroom,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age
execute at @a if entity @e[type=horse,distance=..32] as @e[type=horse,distance=..32] store result score @s gm4_szn_timer run data get entity @s Age

execute if entity @e[scores={gm4_szn_timer=-24000..-12001}] as @e[scores={gm4_szn_timer=-24000..-12001}] run data merge entity @s {Age:-12000,Tags:[gm4_szn_offspring]}
execute if entity @e[scores={gm4_szn_timer=2399..6000}] as @e[scores={gm4_szn_timer=2399..6000}] run data merge entity @s {Age:2400}

execute if entity @e[scores={gm4_szn_timer=-24000..6000}] run scoreboard players reset @e[type=!player,scores={gm4_szn_timer=-24000..6000}] gm4_szn_timer