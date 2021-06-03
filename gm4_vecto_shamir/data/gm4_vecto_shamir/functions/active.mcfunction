#run from main
#@s = player with shamir equipped, sneaking

# minecart
execute if block ~ ~ ~ #minecraft:rails run function gm4_vecto_shamir:vehicle/spawn_minecart

# boat
execute if predicate gm4_vecto_shamir:check_water/below run function gm4_vecto_shamir:vehicle/check_water
execute if block ~ ~-1 ~ #minecraft:ice if predicate gm4_vecto_shamir:check_area/no_collision run function gm4_vecto_shamir:vehicle/spawn_boat
