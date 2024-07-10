
tag @s remove gm4_ce_target

scoreboard players add $raycast_travel_distance gm4_ce_data 3

execute positioned ~-.05 ~-.05 ~-.05 if entity @s[dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] at @s anchored eyes positioned ^ ^ ^ run function gm4_combat_expanded:mob/process/elite/heal/trigger

execute unless score $raycast_travel_distance gm4_ce_data matches ..300 run return run scoreboard players reset $raycast_travel_distance gm4_ce_data
execute positioned ^ ^ ^.3 if block ~ ~ ~ #gm4:no_collision run function gm4_combat_expanded:mob/process/elite/heal/check_los_raycast
