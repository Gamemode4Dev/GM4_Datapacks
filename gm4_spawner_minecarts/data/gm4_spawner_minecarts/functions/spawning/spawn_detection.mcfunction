#@s = spawner minecarts
#at world spawn
#run from main

#execute store result score @s gm4_spawner_data run data get entity @s Delay
execute store result score current_delay gm4_spawner_data run data get entity @s Delay
execute if score @s gm4_spawner_data < current_delay gm4_spawner_data run scoreboard players remove @s gm4_spawner_fuel 10

#disable spawning if out of fuel
execute if score @s gm4_spawner_data < current_delay gm4_spawner_data if score @s gm4_spawner_fuel matches ..0 run data merge entity @s {RequiredPlayerRange:0s}

#store delay to compare later
scoreboard players operation @s gm4_spawner_data = current_delay gm4_spawner_data
