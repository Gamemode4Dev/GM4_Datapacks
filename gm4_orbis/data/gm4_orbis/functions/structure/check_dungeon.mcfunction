scoreboard players set #dungeon_attempted gm4_count 0

scoreboard players set structure_height gm4_count -30
execute unless block ~5 -62 ~ minecraft:bedrock unless block ~5 -61 ~1 minecraft:bedrock positioned ~ -30 ~ if block ~ ~ ~ #gm4_orbis:structure/air_dungeon run function gm4_orbis:structure/check_dungeon_down

scoreboard players set structure_height gm4_count -5
execute unless block ~5 -62 ~ minecraft:bedrock if block ~5 -61 ~1 minecraft:bedrock positioned ~ -5 ~ if block ~ ~ ~ #gm4_orbis:structure/air_dungeon run function gm4_orbis:structure/check_dungeon_down

scoreboard players set structure_height gm4_count 20
execute if block ~5 -62 ~ minecraft:bedrock unless block ~5 -61 ~1 minecraft:bedrock positioned ~ 20 ~ if block ~ ~ ~ #gm4_orbis:structure/air_dungeon run function gm4_orbis:structure/check_dungeon_down

scoreboard players set structure_height gm4_count 45
execute if block ~5 -62 ~ minecraft:bedrock if block ~5 -61 ~1 minecraft:bedrock positioned ~ 45 ~ if block ~ ~ ~ #gm4_orbis:structure/air_dungeon run function gm4_orbis:structure/check_dungeon_down
