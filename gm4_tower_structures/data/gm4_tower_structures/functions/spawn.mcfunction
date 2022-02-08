# spawn a tower based on the biome type.
scoreboard players set #tower_success gm4_count 0

# only place a tower 8% of the time (0.4*0.2)
execute if block ~-2 -63 ~ bedrock run scoreboard players set #tower_success gm4_count 1
execute if block ~-2 -62 ~ bedrock run scoreboard players set #tower_success gm4_count 1

execute if score #tower_success gm4_count matches 0 if score structure_height gm4_count matches 65.. if predicate gm4_dangerous_dungeons:biome/desert store success score #tower_success gm4_count run function gm4_tower_structures:spawn/desert
execute if score #tower_success gm4_count matches 0 if score structure_height gm4_count matches 60.. if predicate gm4_tower_structures:biome/ocean if block ~ ~ ~ water if block ~ 50 ~ water if block ~ -60 ~ bedrock store success score #tower_success gm4_count run function gm4_tower_structures:spawn/ocean
execute if score #tower_success gm4_count matches 0 if score structure_height gm4_count matches 100.. if predicate gm4_dangerous_dungeons:biome/badlands store success score #tower_success gm4_count run function gm4_tower_structures:spawn/badlands
execute if score #tower_success gm4_count matches 0 if score structure_height gm4_count matches 100.. if predicate gm4_dangerous_dungeons:biome/snowy store success score #tower_success gm4_count run function gm4_tower_structures:spawn/snowy

execute if score #tower_success gm4_count matches 0 if score structure_height gm4_count matches 100.. run function gm4_tower_structures:spawn/default
