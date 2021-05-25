#run from main
#@s = player with shamir equipped, sneaking

execute if block ~ ~ ~ #minecraft:rails run function gm4_vecto_shamir:vehicle/spawn_minecart

execute if block ~ ~-1 ~ #gm4:water run function gm4_vecto_shamir:vehicle/check_water
execute if block ~ ~-1 ~ #minecraft:ice if predicate gm4_vecto_shamir:area_no_collision run function gm4_vecto_shamir:vehicle/spawn_boat
