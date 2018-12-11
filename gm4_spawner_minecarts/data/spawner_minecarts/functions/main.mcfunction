#Check for minecarts under spawners
execute as @e[type=minecart] at @s if block ~ ~1 ~ spawner if block ~ ~2 ~ #spawner_minecarts:piston[facing=down] if block ~ ~3 ~ redstone_block run function spawner_minecarts:capture_spawner/enter_minecart

#slow clock for passive regeneration
scoreboard players add passive_clock gm4_spawner_fuel 1
execute if score passive_clock gm4_spawner_fuel matches 750.. run scoreboard players set passive_clock gm4_spawner_fuel 0
#value 75
#slow clock for active regeneration
scoreboard players add active_clock gm4_spawner_fuel 1
execute if score active_clock gm4_spawner_fuel matches 2.. run scoreboard players set active_clock gm4_spawner_fuel 0

#global timer
execute if score passive_clock gm4_spawner_fuel matches 0 run scoreboard players add spawner_global_time gm4_spawner_time 1

#add fuel to spawner minecarts (active)
execute if score active_clock gm4_spawner_fuel matches 1 as @e[type=spawner_minecart,tag=gm4_spawner_minecart,scores={gm4_spawner_fuel=..199}] at @s run function spawner_minecarts:fuel/rail_checks

#add fuel to spawner minecarts (passive)
execute if score passive_clock gm4_spawner_fuel matches 1 as @e[type=spawner_minecart,tag=gm4_spawner_minecart,scores={gm4_spawner_fuel=..199}] run function spawner_minecarts:fuel/passive_regeneration

#pulse detector rail once fully fueled
execute if score active_clock gm4_spawner_fuel matches 1 as @e[type=spawner_minecart,tag=gm4_spawner_minecart,tag=gm4_spawner_minecart_full] at @s run function spawner_minecarts:fuel/detector_rail

#check for successfull spawns
execute as @e[type=area_effect_cloud,tag=gm4_spawner_minecart_decorative_particle] at @s if entity @e[type=spawner_minecart,distance=..1] run kill @s
execute as @e[type=spawner_minecart,tag=gm4_spawner_minecart,scores={gm4_spawner_fuel=1..}] run function spawner_minecarts:spawning/spawn_detection

#play decorative particles
execute as @e[type=area_effect_cloud,tag=gm4_spawner_minecart_decorative_particle] at @s run teleport ^ ^ ^0.4
execute as @e[type=area_effect_cloud,tag=gm4_spawner_minecart_decorative_particle] at @s run particle dragon_breath ~ ~ ~ 0 0 0 .005 3
