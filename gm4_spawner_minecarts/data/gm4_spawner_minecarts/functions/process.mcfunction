# @s = spawner minecarts
# run from main

# check if the spawner minecart is on powered activator rails
# which enables refueling, otherwise it enables spawning
scoreboard players set can_spawn gm4_spawner_data 0
execute unless block ~.29 ~ ~ activator_rail[powered=true] unless block ~-.29 ~ ~ activator_rail[powered=true] unless block ~ ~ ~.29 activator_rail[powered=true] unless block ~ ~ ~-.29 activator_rail[powered=true] run scoreboard players set can_spawn gm4_spawner_data 1

# attempt to refuel
execute if score active_clock gm4_spawner_fuel matches 1 if score can_spawn gm4_spawner_data matches 0 if score @s gm4_spawner_fuel matches ..1999 run function gm4_spawner_minecarts:fuel/active_regeneration
execute if score passive_clock gm4_spawner_fuel matches 1 if score @s gm4_spawner_fuel matches ..1999 run function gm4_spawner_minecarts:fuel/passive_regeneration
execute if entity @s[tag=gm4_spawner_minecart_full] run function gm4_spawner_minecarts:fuel/detector_rail

# remove fuel if a spawn happend
execute store result score current_delay gm4_spawner_data run data get entity @s Delay
execute if score @s gm4_spawner_data < current_delay gm4_spawner_data run scoreboard players remove @s gm4_spawner_fuel 10

# enable or disable spawning
execute if score @s gm4_spawner_data < current_delay gm4_spawner_data if score @s gm4_spawner_fuel matches ..0 run scoreboard players set can_spawn gm4_spawner_data 0
execute if score can_spawn gm4_spawner_data matches 0 run data merge entity @s {RequiredPlayerRange:0s}
execute if score can_spawn gm4_spawner_data matches 1 run data merge entity @s {RequiredPlayerRange:16s}

# store delay to compare next cycle
scoreboard players operation @s gm4_spawner_data = current_delay gm4_spawner_data
