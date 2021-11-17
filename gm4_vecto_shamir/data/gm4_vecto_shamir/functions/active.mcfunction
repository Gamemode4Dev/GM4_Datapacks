# @s = player with shamir equipped, sneaking
# at @s
# run from main

# minecart
execute if block ~ ~ ~ #minecraft:rails run function gm4_vecto_shamir:vehicle/spawn_minecart

# boat
execute if predicate gm4_vecto_shamir:water run function gm4_vecto_shamir:vehicle/position_check
execute if block ~ ~-1 ~ #minecraft:ice if block ~ ~ ~ #gm4:no_collision if block ~.7 ~ ~ #gm4:no_collision if block ~-.7 ~ ~ #gm4:no_collision if block ~ ~ ~.7 #gm4:no_collision if block ~ ~ ~-7 #gm4:no_collision if block ~.7 ~ ~.7 #gm4:no_collision if block ~.7 ~ ~-.7 #gm4:no_collision if block ~-.7 ~ ~.7 #gm4:no_collision if block ~-.7 ~ ~-.7 #gm4:no_collision run function gm4_vecto_shamir:vehicle/spawn_boat
