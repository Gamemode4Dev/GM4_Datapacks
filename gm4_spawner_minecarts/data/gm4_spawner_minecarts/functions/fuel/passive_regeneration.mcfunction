#@s = spawner minecarts
#at world spawn
#run from process

#add fuel to every spawner minecart
scoreboard players add @s gm4_spawner_time 1
scoreboard players add @s gm4_spawner_fuel 10

#minecarts compare
execute unless score @s gm4_spawner_time = spawner_global_time gm4_spawner_time run function gm4_spawner_minecarts:fuel/unloaded_fuel_calculations

tag @s[scores={gm4_spawner_fuel=2000..}] add gm4_spawner_minecart_full
