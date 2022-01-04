# at Y=0 in the center of the chunk
# run from #gm4_orbis:chunk/generate

execute positioned ~ 128 ~ if predicate gm4_cooler_caves:biome/desert positioned ~-8 0 ~-8 run function gm4_cooler_caves:biome/desert
execute positioned ~ 128 ~ if predicate gm4_cooler_caves:biome/badlands positioned ~-8 0 ~-8 run function gm4_cooler_caves:biome/badlands
execute positioned ~ 128 ~ if predicate gm4_cooler_caves:biome/snowy positioned ~-8 0 ~-8 run function gm4_cooler_caves:biome/snowy
