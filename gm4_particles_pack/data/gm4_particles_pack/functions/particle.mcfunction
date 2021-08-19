# @s = armor_stand with particle score
# at @s
# run from main

execute if score @s gm4_particle matches 1 run particle minecraft:heart ~ ~2.0 ~ .2 0 .2 0 1
execute if score @s gm4_particle matches 2 run particle minecraft:flame ~ ~.5 ~ 0 0 0 0 1 force
execute if score @s gm4_particle matches 3 run particle minecraft:barrier ~ ~.5 ~ 0 0 0 0 1
execute if score @s gm4_particle matches 4 run particle minecraft:end_rod ~ ~.5 ~ 10 10 10 0 8 force
execute if score @s gm4_particle matches 7 run particle minecraft:happy_villager ~ ~.5 ~ 2 0 2 0 1
execute if score @s gm4_particle matches 8 run particle minecraft:dripping_water ~ ~.5 ~ 0.04 0 0.04 1 1
execute if score @s gm4_particle matches 9 run particle minecraft:falling_dust snow ~ ~.5 ~ 8 0 8 1 10
