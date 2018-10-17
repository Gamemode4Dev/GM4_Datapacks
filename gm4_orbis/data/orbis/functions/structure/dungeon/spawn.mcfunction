# spawn the dungeon based on the biome type
execute if entity @s[scores={gm4_orbis_biome=0}] run function orbis:structure/dungeon/spawn_default
execute if entity @s[scores={gm4_orbis_biome=1}] run function orbis:structure/dungeon/spawn_ocean
execute if entity @s[scores={gm4_orbis_biome=2}] run function orbis:structure/dungeon/spawn_desert
execute if entity @s[scores={gm4_orbis_biome=3}] run function orbis:structure/dungeon/spawn_snow
execute if entity @s[scores={gm4_orbis_biome=4}] run function orbis:structure/dungeon/spawn_mesa

# populate the dungeon with chests and spawners
# populate the structure with spawners and chests
execute as @e[tag=gm4_orbis_population_marker] at @s run function #orbis:structure/populate_init
execute as @e[tag=gm4_orbis_population,sort=random,limit=1] at @s run function #orbis:structure/populate
kill @e[tag=gm4_orbis_population_marker]

# set scoreboard to prevent another dungeon to be spawned
scoreboard players set structure_height gm4_count 50
