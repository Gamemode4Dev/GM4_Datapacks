#@s = spawner minecarts
#at world spawn
#run slowly from main

#add fuel to every spawner minecart
scoreboard players add @s gm4_spawner_time 1
scoreboard players add @s gm4_spawner_fuel 10

#reenable spawning
execute if score @s gm4_spawner_fuel matches 1.. run data merge entity @s {RequiredPlayerRange:16s}

#minecarts compare
execute unless score @s gm4_spawner_time = spawner_global_time gm4_spawner_time run function spawner_minecarts:fuel/unloaded_fuel_calculations
