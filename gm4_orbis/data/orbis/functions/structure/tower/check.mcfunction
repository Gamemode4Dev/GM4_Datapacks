scoreboard players add structure_height gm4_count 1
execute if block ~ ~ ~ #orbis:structure/air if score structure_height gm4_count matches ..140 positioned ~ ~-1 ~ run function orbis:structure/tower/check
execute unless block ~ ~ ~ #orbis:structure/air if score structure_height gm4_count matches ..140 run function orbis:structure/tower/spawn
