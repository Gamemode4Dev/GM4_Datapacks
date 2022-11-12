# add the climbing tag, and spawn shulkers (which die after a brief time) to allow the player to climb a vertical wall
# @s = player wearing crampons
# at @s
# run from climbing_effects/crampons_equipped.mcfunction

tag @s add gm4_mountaineering_facing_climbable_block

# provide jump boost
effect give @s jump_boost 1 1 true 

# get direction
function gm4_mountaineering:climbing_effects/get_direction_facing

# summon shulker in front and below player, facing towards them
execute if entity @s[scores={gm4_mountaineering_direction_facing=0}] positioned ~ ~-1.5 ~-1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~ ~0.5 {Color:7,Peek:20,AttachFace:2,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=1}] positioned ~1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~ ~0.5 {Color:7,Peek:20,AttachFace:5,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=2}] positioned ~ ~-1.5 ~1 align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~ ~0.5 {Color:7,Peek:20,AttachFace:3,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=3}] positioned ~-1 ~-1.5 ~ align xyz unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, dx=0, dz=0, dy=0] unless block ~0.5 ~ ~0.5 minecraft:air run summon minecraft:shulker ~0.5 ~ ~0.5 {Color:7,Peek:20,AttachFace:4,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist],DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
