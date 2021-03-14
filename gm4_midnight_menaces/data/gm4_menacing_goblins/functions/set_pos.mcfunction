# @s = none
# at world spawn
# called by event

# spread spawn point around a random player, in a 64 block radius
execute at @r[gamemode=!spectator] run spreadplayers ~ ~ 0 64 false @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point]

# set Y position (5 blocks below player to 5 blocks above player)
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s store result entity @s Pos[1] double 1 run data get entity @p Pos[1]

execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s run tp ~ ~-6 ~
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s run function gm4_menacing_goblins:scan_altitude

#kill locations that are too close to the player
execute at @a run kill @e[tag=gm4_goblin_spawn_point,distance=..16]
execute as @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] at @s unless block ~ ~ ~ #gm4:air run kill @s

execute at @e[type=area_effect_cloud,tag=gm4_goblin_spawn_point] run summon zombie ~ ~ ~ {DeathLootTable:"gm4_menacing_goblins:goblin",LeftHanded:1b,CanPickUpLoot:0b,Health:24f,IsBaby:1b,CanBreakDoors:0b,Tags:["gm4_goblin"],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],HandDropChances:[0.3F,-327.67F],ArmorItems:[{},{},{},{id:"minecraft:carved_pumpkin",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:3s}]}}],ArmorDropChances:[1.0F,1.0F,1.0F,-327.67F],ActiveEffects:[{Id:11b,Amplifier:4b,Duration:20,ShowParticles:1b}],Attributes:[{Name:"minecraft:generic.max_health",Base:24.0d},{Name:"minecraft:generic.follow_range",Base:48.0d}]}
