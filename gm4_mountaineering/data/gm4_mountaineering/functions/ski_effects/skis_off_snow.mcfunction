# Give slowness effects when skis are worn and the player is off snow, and not in air
# @s = player without skiing tag and wearing skis
# at @s
# run from main

execute unless block ~ ~-0.3 ~ minecraft:air run effect clear @s minecraft:speed
execute unless block ~ ~-0.3 ~ minecraft:air run effect give @s slowness 3 0 true