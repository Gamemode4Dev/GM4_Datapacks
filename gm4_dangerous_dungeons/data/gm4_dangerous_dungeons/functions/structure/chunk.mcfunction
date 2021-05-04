# attempt to spawn a structure based on the seed
scoreboard players set structure_height gm4_count 15
execute if block ~10 1 ~10 #gm4_dangerous_dungeons:structure/trigger_dungeon positioned ~8 15 ~8 run function gm4_dangerous_dungeons:structure/check_dungeon
