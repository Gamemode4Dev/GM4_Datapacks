# checks what the player/armor stand is holding
# @s = player or armor stand, wearing Boots of Ostara
# at @s
# run from main

# make sure moss/mycelium checks are run before grass, so grass isn't instantly converted to either
# this rule replaces the old "check if grass was converted" check

# first run, check mainhand
execute if predicate gm4_boots_of_ostara:mainhand_moss if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
execute if predicate gm4_boots_of_ostara:mainhand_mycelium if block ~ ~-0.5 ~ #gm4_boots_of_ostara:mycelium_replaceable run setblock ~ ~-0.5 ~ mycelium
execute if predicate gm4_boots_of_ostara:mainhand_grass if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute if predicate gm4_boots_of_ostara:mainhand_crimson_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ crimson_nylium
execute if predicate gm4_boots_of_ostara:mainhand_warped_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ warped_nylium

# now go through offhand
execute if predicate gm4_boots_of_ostara:offhand_moss if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
execute if predicate gm4_boots_of_ostara:offhand_mycelium if block ~ ~-0.5 ~ #gm4_boots_of_ostara:mycelium_replaceable run setblock ~ ~-0.5 ~ mycelium
execute if predicate gm4_boots_of_ostara:offhand_grass if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute if predicate gm4_boots_of_ostara:offhand_crimson_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ crimson_nylium
execute if predicate gm4_boots_of_ostara:offhand_warped_nylium if block ~ ~-0.5 ~ minecraft:netherrack run setblock ~ ~-0.5 ~ warped_nylium
