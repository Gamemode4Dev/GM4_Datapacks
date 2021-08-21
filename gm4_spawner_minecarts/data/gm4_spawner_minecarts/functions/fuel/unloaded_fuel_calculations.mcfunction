#@s = spawner minecarts
#at world spawn
#run slowly from passive_regeneration

scoreboard players operation @s gm4_spawner_time -= spawner_global_time gm4_spawner_time
#add fuel
scoreboard players operation @s gm4_spawner_fuel -= @s gm4_spawner_time

#sync spawner clock
scoreboard players operation @s gm4_spawner_time = spawner_global_time gm4_spawner_time
