# @s = none
# at world spawn
# called by event

# spread spawn point around a random player, in a 48 block radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 48 false @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point]

# set Y position (-5 blocks below to 5 blocks above nearest player)
execute as @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point] at @s store result entity @s Pos[1] double 1 run data get entity @p Pos[1]

execute as @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point] at @s run tp ~ ~-6 ~
execute as @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point] at @s run function gm4_illusioner_nights:scan_altitude

# kill locations that are too close to the player or not in air
execute at @a run kill @e[tag=gm4_illusioner_spawn_point,distance=..16]
execute as @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point] at @s unless block ~ ~ ~ #gm4:air run kill @s

execute as @e[type=area_effect_cloud,tag=gm4_illusioner_spawn_point] at @s run summon illusioner ~ ~ ~ {DeathLootTable:"gm4_illusioner_nights:illusioner",HandItems:[{id:"minecraft:bow",Count:1b},{}]}
