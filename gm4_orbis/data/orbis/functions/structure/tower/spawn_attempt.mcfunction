# choose a structure if possible and spawn it
tag @s add gm4_tower
function #orbis:structure/spawn_init
execute as @e[type=area_effect_cloud,tag=gm4_orbis_spawn_marker,sort=random,limit=1] at @s run function #orbis:structure/spawn
kill @e[type=area_effect_cloud,tag=gm4_orbis_spawn_marker]

# populate the tower with chests and spawners
execute as @e[type=area_effect_cloud,tag=gm4_orbis_populate] at @s run function #orbis:structure/populate_init
kill @e[type=area_effect_cloud,tag=gm4_orbis_populate]
execute as @e[type=area_effect_cloud,tag=gm4_orbis_populate_marker,sort=random] at @s run function orbis:structure/populate_all
kill @e[type=area_effect_cloud,tag=gm4_orbis_populate_marker]

# set scoreboard to prevent another tower to be spawned
scoreboard players set structure_height gm4_count 59
