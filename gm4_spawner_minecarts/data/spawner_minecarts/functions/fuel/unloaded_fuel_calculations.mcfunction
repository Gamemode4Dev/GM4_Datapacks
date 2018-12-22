#@s = spawner minecarts
#at world spawn
#run slowly from passive_regeneration

scoreboard players operation @s gm4_spawner_time -= spawner_global_time gm4_spawner_time
#add fuel
scoreboard players operation @s gm4_spawner_fuel -= @s gm4_spawner_time
#make sure the spawner does not pass the max fuel cap
execute if score @s gm4_spawner_fuel matches 201.. run scoreboard players set @s gm4_spawner_fuel 200

#sync spawner clock
scoreboard players operation @s gm4_spawner_time = spawner_global_time gm4_spawner_time
