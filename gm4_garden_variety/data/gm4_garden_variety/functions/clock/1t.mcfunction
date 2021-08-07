schedule function gm4_garden_variety:clock/1t 1t

execute as @e[tag=gm4_gv_analyzing] if score @s gm4_gv_analyze matches 1.. at @s run function gm4_garden_variety:arborist/analyzer/update_visuals

execute as @e[type=marker,tag=gm4_fruiting_sapling] at @s align xyz run function gm4_garden_variety:integration/fruiting_trees/kill_sapling_marker/process
