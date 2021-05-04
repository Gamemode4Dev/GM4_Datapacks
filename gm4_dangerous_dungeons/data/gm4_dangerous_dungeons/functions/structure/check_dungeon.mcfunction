scoreboard players add structure_height gm4_count 5
execute if block ~ ~ ~ #gm4_dangerous_dungeons:structure/air_dungeon run function gm4_dangerous_dungeons:structure/spawn_attempt
execute unless block ~ ~ ~ #gm4_dangerous_dungeons:structure/air_dungeon if score structure_height gm4_count matches 0..60 positioned ~ ~5 ~ run function gm4_dangerous_dungeons:structure/check_dungeon
