#run from active
#@s = player with shamir equipped, sneaking above water

execute if predicate gm4_vecto_shamir:check_north positioned ~ ~ ~-1 run function gm4_vecto_shamir:vehicle/spawn_boat
execute if predicate gm4_vecto_shamir:check_east positioned ~1 ~ ~ run function gm4_vecto_shamir:vehicle/spawn_boat
execute if predicate gm4_vecto_shamir:check_south positioned ~ ~ ~1 run function gm4_vecto_shamir:vehicle/spawn_boat
execute if predicate gm4_vecto_shamir:check_west positioned ~-1 ~ ~ run function gm4_vecto_shamir:vehicle/spawn_boat
