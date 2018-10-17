# choose a dungeon if possible and spawn it
tag @s add gm4_dungeon
function #orbis:structure/spawn_init
execute as @e[tag=gm4_orbis_spawn_marker,sort=random,limit=1] at @s run function #orbis:structure/spawn
kill @e[tag=gm4_orbis_spawn_marker]

# populate the dungeon with chests and spawners
execute as @e[tag=gm4_orbis_populate] at @s run function #orbis:structure/populate_init
kill @e[tag=gm4_orbis_populate]
execute as @e[tag=gm4_orbis_populate_marker,sort=random] at @s run function orbis:structure/populate_all
kill @e[tag=gm4_orbis_populate_marker]

# set scoreboard to prevent another dungeon to be spawned
scoreboard players set structure_height gm4_count 61
