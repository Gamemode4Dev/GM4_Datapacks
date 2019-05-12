#@s = none
#at world spawn
#called by event

#spread spawn point around a random player, in a 24 block radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 24 false @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point]

#set Y position
execute store result score phantom_altitude gm4_menace run data get entity @s UUIDMost 0.00000000023283064365386962890625
scoreboard players operation phantom_altitude gm4_menace %= 41 gm4_menace
scoreboard players add phantom_altitude gm4_menace 40
execute as @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point] at @s store result score phantom_altitude_base gm4_menace run data get entity @p Pos[1]

scoreboard players operation phantom_altitude gm4_menace += phantom_altitude_base gm4_menace

execute as @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point] store result entity @s Pos.[1] double 1 run scoreboard players get phantom_altitude gm4_menace


execute as @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point] at @s run summon phantom ~ ~ ~ {Tags:[gm4_set_phantom]}

execute as @e[tag=gm4_set_phantom] run function enlarging_phantoms:set_size

scoreboard players reset phantom_altitude gm4_menace
scoreboard players reset phantom_altitude_base gm4_menace