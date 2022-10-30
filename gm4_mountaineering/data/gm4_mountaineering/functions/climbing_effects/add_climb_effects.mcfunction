# add the climbing tag, and spawn shulkers (which die after a brief time) to allow the player to climb a vertical wall
# @s = player wearing crampons
# at @s
# run from climbing_effects/crampons_equipped.mcfunction

tag @s add gm4_mountaineering_facing_climbable_block

# provide jump boost
effect give @s jump_boost 1 1 true 

# get direction
execute run function gm4_mountaineering:climbing_effects/get_direction_facing

# summon shulker in front and below player, facing towards them
execute if entity @s[scores={gm4_mountaineering_direction_facing=0}] unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, distance=..1.5] run summon minecraft:shulker ~ ~-1.5 ~-1 {Color:7,Peek:20,AttachFace:2,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist,gm4_mountaineering_new_shulker],ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=1}] unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, distance=..1.5] run summon minecraft:shulker ~1 ~-1.5 ~ {Color:7,Peek:20,AttachFace:5,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist,gm4_mountaineering_new_shulker],ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=2}] unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, distance=..1.5] run summon minecraft:shulker ~ ~-1.5 ~1 {Color:7,Peek:20,AttachFace:3,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist,gm4_mountaineering_new_shulker],ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}
execute if entity @s[scores={gm4_mountaineering_direction_facing=3}] unless entity @e[type=shulker, tag=gm4_mountaineering_climb_assist, distance=..1.5] run summon minecraft:shulker ~-1 ~-1.5 ~ {Color:7,Peek:20,AttachFace:4,Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:[gm4_mountaineering_climb_assist,gm4_mountaineering_new_shulker],ActiveEffects:[{Id:14,Duration:100000,ShowParticles:0b}]}

# assign scores to new shulkers
scoreboard players set @e[type=minecraft:shulker, tag=gm4_mountaineering_new_shulker] gm4_mountaineering_climbing_shulker_countdown 7
execute as @e[type=minecraft:shulker, tag=gm4_mountaineering_new_shulker] run data merge entity @s {DeathLootTable:"minecraft:empty"}

# damage/kill old shulkers
execute run function gm4_mountaineering:climbing_effects/damage_shulkers
