# attempt to spawn a structure based on the seed
scoreboard players set structure_height gm4_count 0
execute if block ~10 1 ~10 #orbis:structure/trigger_dungeon positioned ~ 20 ~ run function orbis:structure/dungeon/check
execute if block ~10 1 ~10 #orbis:structure/trigger_tower positioned ~ 200 ~ run function orbis:structure/tower/check
