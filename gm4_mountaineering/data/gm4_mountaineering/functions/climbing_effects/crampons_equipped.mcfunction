# check for climable blocks in front and run climbing functions
# @s = player wearing crampons
# at @s
# run from climbing_main

# Check for stone, grass, or dirt in front of the player
execute if entity @s[predicate=gm4_mountaineering:hands_empty] anchored eyes if block ^ ^ ^1 #gm4_mountaineering:climbable_blocks run function gm4_mountaineering:climbing_effects/add_climb_effects

# Remove climbing tag when no longer facing a climbable block
execute anchored eyes unless block ^ ^ ^1 minecraft:stone unless block ^ ^ ^1 minecraft:grass_block unless block ^ ^ ^1 minecraft:dirt run tag @s remove gm4_mountaineering_facing_climbable_block
