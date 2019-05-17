#@s = none
#at world spawn
#called by event

#spread spawn point around a random player, in a 64 block radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 64 false @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point]

#set Y position
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s store result entity @s Pos.[1] double 1 run data get entity @p Pos[1]

execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s run tp ~ ~-6 ~
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s run function menacing_goblins:scan_altitude

#kill locations that are too close to the player
execute at @a run kill @e[tag=gm4_goblin_spawn_point,distance=..24]
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s unless block ~ ~ ~ air unless block ~ ~ ~ cave_air run kill @s

execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s run summon zombie ~ ~ ~ {DeathLootTable:"menacing_goblins:goblin",LeftHanded:1b,CanPickUpLoot:0b,Health:12f,IsBaby:1b,CanBreakDoors:0b,Tags:["gm4_goblin"],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],HandDropChances:[0.3F,0.85F],ArmorItems:[{},{},{},{id:"minecraft:carved_pumpkin",Count:1b}],ArmorDropChances:[0.85F,0.85F,0.85F,-327.67F],ActiveEffects:[{Id:11b,Amplifier:4b,Duration:5,ShowParticles:1b}],Attributes:[{Name:generic.maxHealth,Base:12},{Name:generic.followRange,Base:32}]}
