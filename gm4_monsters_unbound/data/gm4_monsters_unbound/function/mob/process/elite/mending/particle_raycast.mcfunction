# check LOS to this undead
# @s = undead near mending elite
# at @s
# run from mob/process/elite/mending/process
# run from here

scoreboard players remove $raycast_travel_distance gm4_mu_data 1

particle dust_color_transition{from_color:[0.000,1.000,0.000],scale:0.65,to_color:[0.000,0.000,0.000]} ~ ~ ~ 0.1 0.1 0.1 0 0

execute unless score $raycast_travel_distance gm4_mu_data matches 1.. run particle dust_color_transition{from_color:[0.000,1.000,0.000],scale:0.85,to_color:[0.000,0.000,0.000]} ~ ~ ~ 0.22 0.22 0.22 0.5 12

execute if score $raycast_travel_distance gm4_mu_data matches 1.. positioned ^ ^ ^-.1 run function gm4_monsters_unbound:mob/process/elite/mending/particle_raycast
