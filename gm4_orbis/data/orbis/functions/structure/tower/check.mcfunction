scoreboard players remove structure_height gm4_count 1
execute unless block ~ ~ ~ #orbis:structure/air_tower run function orbis:structure/tower/spawn_attempt
execute if block ~ ~ ~ #orbis:structure/air_tower if score structure_height gm4_count matches 60.. positioned ~ ~-1 ~ run function orbis:structure/tower/check
