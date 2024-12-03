# check LOS to this undead
# @s = undead near mending elite
# at @s
# run from mob/process/elite/mending/process
# run from here

execute if score $target_healed gm4_mu_data matches 1.. run return 0

tag @s remove gm4_mu_target

scoreboard players add $raycast_travel_distance gm4_mu_data 3

execute positioned ~-.05 ~-.05 ~-.05 if entity @s[dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] at @s anchored eyes positioned ^ ^ ^ run function gm4_monsters_unbound:mob/process/elite/mending/trigger

execute unless score $raycast_travel_distance gm4_mu_data matches ..300 run return run scoreboard players reset $raycast_travel_distance gm4_mu_data
execute positioned ^ ^ ^.3 if block ~ ~ ~ #gm4:no_collision run function gm4_monsters_unbound:mob/process/elite/mending/check_los_raycast
