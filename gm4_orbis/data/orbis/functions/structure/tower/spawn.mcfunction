# spawn a tower based on the biome type.
# structure height is the number of blocks below y=200
# eg. score=50 means structure at y=150
# a tower in a snow biome needs to be above y=70 while the other biomes require y=80
execute if score structure_height gm4_count matches ..120 if entity @s[scores={gm4_orbis_biome=0}] run function orbis:structure/tower/spawn_default
execute if score structure_height gm4_count matches ..120 if entity @s[scores={gm4_orbis_biome=2}] run function orbis:structure/tower/spawn_desert
execute if score structure_height gm4_count matches ..130 if entity @s[scores={gm4_orbis_biome=3}] run function orbis:structure/tower/spawn_snow
execute if score structure_height gm4_count matches ..120 if entity @s[scores={gm4_orbis_biome=4}] run function orbis:structure/tower/spawn_mesa

# populate the structure with spawners and chests
execute as @e[tag=orbis_spawner] at @s run function orbis:structure/spawner_default
execute as @e[tag=orbis_chest] at @s run function orbis:structure/chest_tower
kill @e[tag=orbis_spawner]
kill @e[tag=orbis_chest]

# set scoreboard to prevent another tower to be spawned
scoreboard players set structure_height gm4_count 200
