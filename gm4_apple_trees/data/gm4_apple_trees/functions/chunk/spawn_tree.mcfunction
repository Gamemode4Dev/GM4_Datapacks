# Generates a tree using a world seed and location dependent seed.
# @s = orbis chunk marker to generate a new chunk: @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated] 
# at tree spawn position
# run from gm4_apple_trees:chunk/scan_column

summon minecraft:marker ~ ~ ~ {Tags:["gm4_apple_tree_sapling","gm4_apple_tree_new"]}
execute as @e[type=minecraft:marker,tag=gm4_apple_tree_new,limit=1] at @s align xyz run function gm4_apple_trees:chunk/generate_seed
