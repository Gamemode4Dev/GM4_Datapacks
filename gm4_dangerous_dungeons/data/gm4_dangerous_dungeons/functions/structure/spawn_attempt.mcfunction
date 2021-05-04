# choose a structure if possible and spawn it
function #gm4_dangerous_dungeons:structure/spawn
execute as @e[type=item,tag=gm4_orbis_structure,sort=random,limit=1] at @s run function gm4_dangerous_dungeons:structure/spawn
kill @e[type=item,tag=gm4_orbis_structure]

# populate the structure with chests and spawners
execute as @e[type=area_effect_cloud,tag=gm4_orbis_populate] at @s run function #gm4_dangerous_dungeons:structure/populate_init
kill @e[type=area_effect_cloud,tag=gm4_orbis_populate]
execute as @e[type=area_effect_cloud,tag=gm4_orbis_populate_marker,sort=random] at @s run function gm4_dangerous_dungeons:structure/populate_all
kill @e[type=area_effect_cloud,tag=gm4_orbis_populate_marker]

# set scoreboard to prevent another structure to be spawned
scoreboard players set structure_height gm4_count -1
