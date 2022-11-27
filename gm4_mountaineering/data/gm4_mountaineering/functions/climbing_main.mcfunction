# Running on a faster clock to enable smoother climbing

# Adds vertical climbing abilities when wearing crampons and not holding anything
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_using_crampons] at @s if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 #gm4_mountaineering:climbable_blocks run function gm4_mountaineering:climbing_effects/add_climb_effects

# Apply damage to any climbing shulkers
execute as @e[type=minecraft:shulker,tag=gm4_mountaineering_climb_assist] at @s run function gm4_mountaineering:climbing_effects/damage_shulkers

schedule function gm4_mountaineering:climbing_main 4t
