# Checks if the terrain has loaded
# @s = metachunk
# run from main

scoreboard players set #success gm4_count 0
execute if block ~ ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~-16 ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~16 ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~ ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~ ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~-16 ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~-16 ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~16 ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute if block ~16 ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~ ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~-16 ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~16 ~ ~ minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~ ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~ ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~-16 ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~-16 ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~16 ~ ~-16 minecraft:bedrock run scoreboard players add #success gm4_count 1
execute unless block ~16 ~ ~16 minecraft:bedrock run scoreboard players add #success gm4_count 1

execute if score #success gm4_count matches 9 run function gm4_orbis:metachunk/generate
