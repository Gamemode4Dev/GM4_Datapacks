#@s = spawner minecarts
#at world spawn
#run from main

execute store result score @s gm4_spawner_data run data get entity @s Delay
execute if score @s gm4_spawner_data matches 1..16 run scoreboard players remove @s gm4_spawner_fuel 1

#disable spawning if out of fuel
execute if score @s gm4_spawner_data matches 1..16 if score @s gm4_spawner_fuel matches ..0 run data merge entity @s {RequiredPlayerRange:0s}
