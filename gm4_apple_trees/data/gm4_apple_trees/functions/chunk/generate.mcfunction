# checks if the orbis chunk should spawn an apple tree
# @s = orbis chunk marker to generate a new chunk: @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated] 
# at @s aligned at the negative-most chunk corner
# run from #gm4_orbis:chunk/generate

scoreboard players set structure_height gm4_count 248
execute if score forest gm4_orbis_biome matches 1 if predicate gm4_apple_trees:forest if block ~10 54 ~5 minecraft:coal_ore positioned ~7 248 ~7 run function gm4_apple_trees:chunk/scan_column
