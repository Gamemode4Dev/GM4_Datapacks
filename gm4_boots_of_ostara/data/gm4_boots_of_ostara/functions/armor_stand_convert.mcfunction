# checks what the armorstand is holding
# @s = armor stand
# at @s
# run from main

execute store success score $grass_check gm4_boo_data if predicate gm4_boots_of_ostara:armor_stand_grass if block ~ ~-0.5 ~ #minecraft:dirt run setblock ~ ~-0.5 ~ grass_block
execute unless score $grass_check gm4_boo_data matches 1 if predicate gm4_boots_of_ostara:armor_stand_moss if block ~ ~-0.5 ~ #gm4_boots_of_ostara:moss_replaceable run setblock ~ ~-0.5 ~ moss_block
scoreboard players reset $grass_check gm4_boo_data
