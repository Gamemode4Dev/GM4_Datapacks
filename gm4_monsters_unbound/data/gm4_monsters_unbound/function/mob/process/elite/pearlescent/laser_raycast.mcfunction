# raycast to target player
# @s = pearlescent elite
# at @s
# run from mob/process/elite/pearlescent/laser
# run from here

particle dust_color_transition{from_color:[0.400,0.325,0.450],to_color:[0.800,0.650,0.900],scale:1.25} ^0.125 ^ ^ 0.01 0.01 0.01 0 1
particle dust_color_transition{from_color:[0.400,0.325,0.450],to_color:[0.800,0.650,0.900],scale:1.25} ^-0.125 ^ ^ 0.01 0.01 0.01 0 1

particle dust_color_transition{from_color:[0.400,0.325,0.450],to_color:[0.800,0.650,0.900],scale:1.25} ^0.125 ^ ^0.1 0.01 0.01 0.01 0 1
particle dust_color_transition{from_color:[0.400,0.325,0.450],to_color:[0.800,0.650,0.900],scale:1.25} ^-0.125 ^ ^0.1 0.01 0.01 0.01 0 1

execute positioned ~-0.1 ~-0.1 ~-0.1 as @a[gamemode=!spectator,dx=0,dy=0,dz=0] positioned ~-0.8 ~-0.8 ~-0.8 if entity @s[dx=0,dy=0,dz=0] run function gm4_monsters_unbound:mob/process/elite/pearlescent/laser_damage

scoreboard players remove $laser_limit gm4_mu_data 1
execute if score $laser_limit gm4_mu_data matches 1.. positioned ^ ^ ^0.2 if block ~ ~ ~ #gm4:no_collision run function gm4_monsters_unbound:mob/process/elite/pearlescent/laser_raycast
