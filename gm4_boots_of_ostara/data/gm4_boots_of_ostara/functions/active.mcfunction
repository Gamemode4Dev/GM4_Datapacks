execute if block ~ ~-0.5 ~ dirt if predicate gm4_boots_of_ostara:holding_grass run setblock ~ ~-0.5 ~ grass_block
execute if block ~ ~-0.5 ~ soul_sand if block ~ ~0.5 ~ air positioned ~ ~0.5 ~ if predicate gm4_boots_of_ostara:holding_nether_wart run function gm4_boots_of_ostara:plant/nether_wart
execute if block ~ ~-0.5 ~ farmland if block ~ ~0.5 ~ air positioned ~ ~0.5 ~ run function gm4_boots_of_ostara:plant
