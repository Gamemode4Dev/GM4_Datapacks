# @s = none
# at world spawn
# called by slow_clock

# spread spawn point around a random player, in a 24 block radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 24 false @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point]

# set Y position relative to player (20-40 blocks above the nearest player)
execute at @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point] store result score phantom_altitude_base gm4_menace_data run data get entity @p Pos[1]

execute store result score phantom_altitude gm4_menace_data run data get entity @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1] UUID[0]
scoreboard players operation phantom_altitude gm4_menace_data %= 21 gm4_menace_data
scoreboard players add phantom_altitude gm4_menace_data 20

scoreboard players operation phantom_altitude gm4_menace_data += phantom_altitude_base gm4_menace_data

execute store result entity @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point,limit=1] Pos[1] double 1 run scoreboard players get phantom_altitude gm4_menace_data

# summon new phantom
execute as @e[type=area_effect_cloud,tag=gm4_phantom_spawn_point] at @s run summon phantom ~ ~ ~ {Tags:["gm4_enlarged_phantom"]}

# set size of new phantom
execute as @e[tag=gm4_enlarged_phantom] run function gm4_enlarging_phantoms:set_size

# reset scores
scoreboard players reset phantom_altitude gm4_menace_data
scoreboard players reset phantom_altitude_base gm4_menace_data
