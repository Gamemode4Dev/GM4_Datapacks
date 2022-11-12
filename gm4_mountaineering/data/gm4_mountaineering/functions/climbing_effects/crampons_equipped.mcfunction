# check for climable blocks in front, run climbing functions, and apply slowness effects when wearing crampons
# @s = player wearing crampons
# at @s
# run from main

# Add slowness effects
attribute @s minecraft:generic.movement_speed modifier add 4e6464b7-24dd-4750-a428-74898a251ead gm4_mountaineering_crampon_slowness -0.2 multiply_base

# Check for stone, grass, or dirt in front of the player
execute if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 minecraft:stone run function gm4_mountaineering:climbing_effects/add_climb_effects
execute if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 minecraft:grass_block run function gm4_mountaineering:climbing_effects/add_climb_effects
execute if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 minecraft:dirt run function gm4_mountaineering:climbing_effects/add_climb_effects

execute anchored eyes unless block ^ ^ ^1 minecraft:stone unless block ^ ^ ^1 minecraft:grass_block unless block ^ ^ ^1 minecraft:dirt run tag @s remove gm4_mountaineering_facing_climbable_block

# Continue to damage any shulkers that remain (this happens if a climbing player looks away from the climbing surface, so they can't climb any more but can look around)
execute if entity @e[type=minecraft:shulker, tag=gm4_mountaineering_climb_assist] run function gm4_mountaineering:climbing_effects/damage_shulkers
