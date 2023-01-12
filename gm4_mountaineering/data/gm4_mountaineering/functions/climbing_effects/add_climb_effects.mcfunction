# add the climbing tag, and spawn shulkers (which die after a brief time) to allow the player to climb a vertical wall
# @s = player wearing crampons, with using_crampons tag, and facing a climbable block
# at @s
# run from player_fast_main

# provide jump boost
effect give @s jump_boost 1 1 true 

# summon shulker in front and below player, but 1000 blocks up, facing towards them
execute if entity @s[y_rotation=135..-135] positioned ~ ~-1.5 ~-1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0.5, dz=0.5, dy=1] unless block ~0.5 ~1 ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,AttachFace:2,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist, gm4_mountaineering_new_shulker],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=-135..-45] positioned ~1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0.5, dz=0.5, dy=1] unless block ~0.5 ~1 ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,AttachFace:5,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist, gm4_mountaineering_new_shulker],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=-45..45] positioned ~ ~-1.5 ~1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0.5, dz=0.5, dy=1] unless block ~0.5 ~1 ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,AttachFace:3,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist, gm4_mountaineering_new_shulker],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[y_rotation=45..135] positioned ~-1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0.5, dz=0.5, dy=1] unless block ~0.5 ~1 ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~1000 ~0.5 {Color:7,AttachFace:4,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist, gm4_mountaineering_new_shulker],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}

# teleport shulker down 999 blocks to bring them into position (999 to put the shulker one block below feet)
execute positioned ~ ~1000 ~ as @e[type=shulker, tag=gm4_mountaineering_climb_assist, tag=gm4_mountaineering_new_shulker] at @s run teleport @s ~ ~-999 ~

# schedule a function to set the peek of the shulker (can't do it in the same tick as teleporting)
schedule function gm4_mountaineering:climbing_effects/reset_shulker_peek 1t
