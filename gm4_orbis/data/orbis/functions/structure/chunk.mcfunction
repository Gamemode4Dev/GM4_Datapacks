# attempt to spawn a structure based on the seed
scoreboard players set structure_height gm4_count 200
execute if block ~10 1 ~10 #orbis:structure/trigger_tower positioned ~8 200 ~8 run function orbis:structure/tower/check

scoreboard players set structure_height gm4_count 15
execute if block ~10 1 ~10 #orbis:structure/trigger_dungeon positioned ~8 15 ~8 run function orbis:structure/dungeon/check
