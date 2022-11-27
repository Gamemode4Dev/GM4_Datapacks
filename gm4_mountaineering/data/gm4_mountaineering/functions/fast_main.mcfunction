# Running on a faster clock to enable smoother climbing and for poles fall damage reduction to work

# Adds vertical climbing abilities when wearing crampons and not holding anything
execute as @a[gamemode=!spectator,tag=gm4_mountaineering_using_crampons] at @s if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 #gm4_mountaineering:climbable_blocks run function gm4_mountaineering:climbing_effects/add_climb_effects

# Give resistance before landing to reduce fall damage when holding poles in both hands
execute as @a[gamemode=!spectator,predicate=gm4_mountaineering:holding_poles] at @s if block ~ ~-2 ~ minecraft:air run effect give @s resistance 1 1

schedule function gm4_mountaineering:fast_main 4t
