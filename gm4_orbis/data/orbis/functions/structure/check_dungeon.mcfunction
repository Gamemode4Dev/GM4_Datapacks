scoreboard players add structure_height gm4_count 5
execute if block ~ ~ ~ #orbis:structure/air_dungeon run function orbis:structure/spawn_attempt
execute unless block ~ ~ ~ #orbis:structure/air_dungeon if score structure_height gm4_count matches ..59 positioned ~ ~5 ~ run function orbis:structure/check_dungeon
