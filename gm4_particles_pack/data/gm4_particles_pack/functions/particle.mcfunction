# @s = armorstand with a particle score
# run from main
execute if score @s gm4_particle matches 1 run particle minecraft:heart ~ ~2.0 ~ .2 0 .2 0 1
execute if score @s gm4_particle matches 2 run particle minecraft:flame ~ ~.5 ~ 0 0 0 0 1 force
execute if score @s gm4_particle matches 3 run particle minecraft:barrier ~ ~.5 ~ 0 0 0 0 1
execute if score @s gm4_particle matches 4 run particle minecraft:end_rod ~ ~.5 ~ 10 10 10 0 8 force
execute if score @s gm4_particle matches 7 run particle minecraft:happy_villager ~ ~.5 ~ 2 0 2 0 1
execute if score @s gm4_particle matches 8 run particle minecraft:dripping_water ~ ~.5 ~ 0.04 0 0.04 1 1
execute if score @s gm4_particle matches 9 run particle minecraft:falling_dust snow ~ ~.5 ~ 8 0 8 1 10
execute if score @s gm4_particle matches 10 run particle minecraft:falling_dust minecraft:pink_wool ~ ~4 ~ 2 1 2 0 5
execute if score @s gm4_particle matches 11 run particle minecraft:falling_dust minecraft:orange_wool ~ ~4 ~ 2 1 2 0 2
execute if score @s gm4_particle matches 11 run particle minecraft:falling_dust minecraft:brown_wool ~ ~4 ~ 2 1 2 0 3
execute if score @s gm4_particle matches 12 run particle minecraft:falling_dust minecraft:lime_wool ~ ~4 ~ 2 1 2 0 5
execute if score @s gm4_particle matches 13 run particle minecraft:falling_dust minecraft:white_wool ~ ~4 ~ 2 1 2 0 5
execute if score @s gm4_particle matches 14 run particle minecraft:falling_dust minecraft:black_wool ~ ~4 ~ 2 1 2 0 5
execute if score @s gm4_particle matches 15 run particle minecraft:lava ~ ~ ~ 2 0 2 0 5
execute if score @s gm4_particle matches 16 run particle minecraft:totem_of_undying ~ ~4 ~ 2 1 2 0 5
execute if score @s gm4_particle matches 17 run particle minecraft:totem_of_undying ~ ~1 ~ 0 0 0 1 5
execute if score @s gm4_particle matches 18 run particle minecraft:portal ~ ~1 ~ 0 0 0 1 5
execute if score @s gm4_particle matches 19 run particle minecraft:enchant ~ ~1 ~ 0 0 0 1 5
