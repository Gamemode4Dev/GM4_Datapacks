# add the climbing tag, and spawn shulkers (which die after a brief time) to allow the player to climb a vertical wall
# @s = player wearing crampons, with using_crampons tag, and facing a climbable block
# at @s
# run from player_fast_main

# provide jump boost
effect give @s jump_boost 1 1 true 

# summon shulker in front and below player, but 1000 blocks up, facing towards them
execute if entity @s[y_rotation=135..180] positioned ~ ~-1.5 ~-1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,Peek:20,AttachFace:2,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=-180..-135] positioned ~ ~-1.5 ~-1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,Peek:20,AttachFace:2,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=-135..-45] positioned ~1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,Peek:20,AttachFace:5,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=-45..45] positioned ~ ~-1.5 ~1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,Peek:20,AttachFace:3,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=45..135] positioned ~-1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,Peek:20,AttachFace:4,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}

# teleport shulker down 700 blocks to bring them into position
execute as @e[type=shulker, tag=gm4_mountaineering_climb_assist, y=1000, dy=500] at @s run teleport @s ~ ~-1000 ~
