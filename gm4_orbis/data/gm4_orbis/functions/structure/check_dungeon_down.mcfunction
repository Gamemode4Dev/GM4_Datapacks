scoreboard players remove structure_height gm4_count 1
execute if block ~ ~1 ~ #gm4_orbis:structure/air_dungeon unless block ~ ~ ~ #gm4_orbis:structure/air_dungeon store success score #dungeon_attempted gm4_count run function gm4_orbis:structure/spawn_attempt
execute if score structure_height gm4_count matches -50.. if score #dungeon_attempted gm4_count matches 0 positioned ~ ~-1 ~ run function gm4_orbis:structure/check_dungeon_down
