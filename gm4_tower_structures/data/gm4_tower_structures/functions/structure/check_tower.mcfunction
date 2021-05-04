scoreboard players remove structure_height gm4_count 1
execute unless block ~ ~ ~ #gm4_tower_structures:structure/air_tower run function gm4_tower_structures:structure/spawn_attempt
execute if block ~ ~ ~ #gm4_tower_structures:structure/air_tower if score structure_height gm4_count matches 60.. positioned ~ ~-1 ~ run function gm4_tower_structures:structure/check_tower
