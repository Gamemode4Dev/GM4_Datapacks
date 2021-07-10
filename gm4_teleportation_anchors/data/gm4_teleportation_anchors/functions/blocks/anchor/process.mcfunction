# @s = teleportation anchor
# run from main

execute unless block ~ ~ ~ lodestone run function gm4_teleportation_anchors:blocks/anchor/destroy

particle minecraft:portal ~ ~0.65 ~ 0 -0.2 0 0.2 20
particle minecraft:end_rod ~ ~0.8 ~ 0.1 -0.3 0.1 0.01 1
