# @s = metachunk
# at Y=0 of the center of the current chunk
# run from metachunk/generate

# try to spawn a structure before any chunk modifications have been done
execute unless block ~ 0 ~ minecraft:barrier run function gm4_orbis:structure/chunk

# other modules can have functions in this tag as expansion to orbis
execute unless block ~ 0 ~ minecraft:barrier run function #gm4_orbis:chunk/generate

# Remove in 1.19: upgrade old orbis chunks
execute if block ~ 0 ~ minecraft:barrier positioned ~-8 0 ~-8 run function gm4_orbis:chunk/upgrade

# mark the chunk as generated
scoreboard players add chunk_count gm4_orbis_config 1
