scoreboard players add structure_height gm4_count 1
execute unless block ~ ~ ~ minecraft:cave_air if score structure_height gm4_count matches ..30 positioned ~ ~1 ~ run function orbis:structure/dungeon/check
execute if block ~ ~ ~ minecraft:cave_air if score structure_height gm4_count matches ..30 run function orbis:structure/dungeon/spawn
