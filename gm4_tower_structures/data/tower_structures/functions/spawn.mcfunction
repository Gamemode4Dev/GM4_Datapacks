# spawn a tower based on the biome type.
execute if score structure_height gm4_count matches 60.. if block ~ ~ ~ water if block ~ 40 ~ water if block ~ 3 ~ bedrock if block ~ 4 ~ bedrock if score ocean gm4_orbis_biome matches 1 run function tower_structures:spawn/ocean
execute if score structure_height gm4_count matches 80.. if score desert gm4_orbis_biome matches 1 run function tower_structures:spawn/desert
execute if score structure_height gm4_count matches 80.. if score badlands gm4_orbis_biome matches 1 run function tower_structures:spawn/badlands
execute if score structure_height gm4_count matches 80.. if score snowy gm4_orbis_biome matches 1 run function tower_structures:spawn/snowy

execute if score structure_height gm4_count matches ..50 unless score ocean gm4_orbis_biome matches 1 unless score desert gm4_orbis_biome matches 1 unless score badlands gm4_orbis_biome matches 1 unless score snowy gm4_orbis_biome matches 1 run function tower_structures:spawn/default
