# @s = gm4_spawner_minecart_decorative_particle
# at @s
# run from main

execute if entity @e[type=spawner_minecart,distance=..1] run kill @s
particle minecraft:flame ~ ~ ~ 0.05 0.05 0.05 0.01 1
teleport ^ ^ ^0.4
