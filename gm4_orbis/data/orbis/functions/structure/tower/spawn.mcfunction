execute if score height gm4_count matches 80.. if entity @s[scores={orbis_biome=0}] run function orbis:structure/tower/spawn_default
execute if score height gm4_count matches 80.. if entity @s[scores={orbis_biome=2}] run function orbis:structure/tower/spawn_desert
execute if entity @s[scores={orbis_biome=3}] run function orbis:structure/tower/spawn_snow
execute if score height gm4_count matches 80.. if entity @s[scores={orbis_biome=4}] run function orbis:structure/tower/spawn_mesa

execute at @e[tag=orbis_spawner] run function orbis:structure/spawner_default
execute at @e[tag=orbis_chest] run function orbis:structure/chest
kill @e[tag=orbis_spawner]
kill @e[tag=orbis_chest]

tag @s add orbis_spawned
