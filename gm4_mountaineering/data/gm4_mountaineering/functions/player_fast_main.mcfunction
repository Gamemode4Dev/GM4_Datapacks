# Submain function to limit `as @a` calls in fast_main
# @s = player not in spectator
# at @s
# run from fast_main

# Adds vertical climbing abilities when wearing crampons and not holding anything
execute if entity @s[gamemode=!spectator,tag=gm4_mountaineering_using_crampons,predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 #gm4_mountaineering:climbable_blocks run function gm4_mountaineering:climbing_effects/add_climb_effects

# Give resistance before landing to reduce fall damage when holding poles in both hands
execute if entity @s[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] if block ~ ~-2 ~ minecraft:air run effect give @s resistance 1 1
