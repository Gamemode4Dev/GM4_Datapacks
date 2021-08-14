# checks if the orbis chunk should spawn a custom tree
# @s = orbis chunk marker to generate a new chunk: @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated] 
# at @s aligned at the negative-most chunk corner
# run from #gm4_orbis:chunk/biome/beach

scoreboard players set structure_height gm4_count 248

# king palm tree
execute if score beach gm4_orbis_biome matches 1 if predicate gm4_garden_variety:biome/beach if block ~ 31 ~ minecraft:stone positioned ~6 248 ~12 run function gm4_garden_variety_trees:generate/king_palm/integration/orbis/scan_column
