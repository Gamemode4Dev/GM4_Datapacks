# attempt to spawn a structure based on the seed
scoreboard players set structure_height gm4_count 200
execute if block ~10 1 ~10 #gm4_tower_structures:structure/trigger_tower positioned ~8 200 ~8 run function gm4_tower_structures:structure/check_tower
