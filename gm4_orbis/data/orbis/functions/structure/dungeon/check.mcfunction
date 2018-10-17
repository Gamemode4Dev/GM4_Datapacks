scoreboard players add structure_height gm4_count 1
execute if block ~ ~ ~ #orbis:structure/air_dungeon run tp @a ~ ~ ~
execute if block ~ ~ ~ #orbis:structure/air_dungeon run function orbis:structure/dungeon/spawn_attempt
execute unless block ~ ~ ~ #orbis:structure/air_dungeon if score structure_height gm4_count matches ..60 positioned ~ ~1 ~ run function orbis:structure/dungeon/check
