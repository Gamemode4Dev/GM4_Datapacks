# get the biome type
execute positioned ~ ~ ~ run function orbis:biome/detect
# mark the chunk as scanned
tag @s add gm4_scanned
