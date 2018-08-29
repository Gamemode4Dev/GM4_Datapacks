# get the biome type
execute positioned ~ ~ ~ run function orbis:chunk/get_biome
# mark the chunk as scanned
tag @s add orbis_scanned
