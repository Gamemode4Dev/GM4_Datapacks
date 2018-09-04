# spawn a tower based on the biome type
# a tower in a snow biome needs to be above y=70 while the other biomes require y=80
execute if score height gm4_count matches 80.. if entity @s[scores={gm4_orbis_biome=0}] run function orbis:structure/tower/spawn_default
execute if score height gm4_count matches 80.. if entity @s[scores={gm4_orbis_biome=2}] run function orbis:structure/tower/spawn_desert
execute if entity @s[scores={gm4_orbis_biome=3}] run function orbis:structure/tower/spawn_snow
execute if score height gm4_count matches 80.. if entity @s[scores={gm4_orbis_biome=4}] run function orbis:structure/tower/spawn_mesa

# populate the structure with spawners and chests
execute at @e[tag=orbis_spawner] run function orbis:structure/spawner_default
execute at @e[tag=orbis_chest] run function orbis:structure/chest
kill @e[tag=orbis_spawner]
kill @e[tag=orbis_chest]

# mark the structure marker as spawned
tag @s add orbis_spawned
