# attempt to spawn a structure based on the deepslate-bedrock variation at the bottom of the world
# Y=-63 has 0.8 chance of being bedrock, Y=-62 has 0.6 chance, etc 

scoreboard players set structure_height gm4_count 250
execute unless block ~3 -62 ~-5 minecraft:bedrock positioned ~ 250 ~ run function gm4_orbis:structure/check_tower

execute if block ~3 -62 ~-4 minecraft:bedrock run function gm4_orbis:structure/check_dungeon
