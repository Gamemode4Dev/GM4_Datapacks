loot spawn ~ ~ ~ loot orbis:detect_biome
execute as @e[type=item,distance=..1,limit=1] run function orbis:chunk/get_biomes
