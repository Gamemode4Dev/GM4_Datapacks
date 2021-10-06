# checks what the player is holding
# @s = player, wearing Boots of Ostara
# at @s
# run from main

execute if predicate gm4_boots_of_ostara:holding_grass if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute if predicate gm4_boots_of_ostara:holding_moss if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
