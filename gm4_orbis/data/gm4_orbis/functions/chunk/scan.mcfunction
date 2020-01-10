loot spawn ~ ~ ~ loot gm4_orbis:detect_biome
execute as @e[type=item,distance=..1,limit=1] run function gm4_orbis:chunk/get_biomes
