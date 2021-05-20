#run from main
#@s = player with shamir equipped, sneaking

execute if block ~ ~ ~ #minecraft:rails run function gm4_vecto_shamir:vehicle/spawn_minecart

execute if block ~ ~-1 ~ #gm4:water if block ~ ~ ~ #gm4:air run function gm4_vecto_shamir:vehicle/check_water
execute if block ~ ~-1 ~ #minecraft:ice run function gm4_vecto_shamir:vehicle/spawn_boat
