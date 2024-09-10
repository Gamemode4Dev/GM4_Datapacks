# raycast to target player
# @s = pearlescent elite
# at @s
# run from mob/process/elite/pearlescent/lazer
# run from here

particle dust{color:[0.408,0.325,0.455],scale:0.5} ^ ^ ^ 0.01 0.01 0.01 0 1
particle dust{color:[0.408,0.325,0.455],scale:0.5} ^ ^ ^-0.5 0.01 0.01 0.01 0 1
particle dust{color:[0.408,0.325,0.455],scale:0.5} ^ ^ ^-1 0.01 0.01 0.01 0 1
particle dust{color:[0.408,0.325,0.455],scale:0.5} ^ ^ ^-1.5 0.01 0.01 0.01 0 1

execute positioned ~-0.1 ~-0.1 ~-0.1 as @a[gamemode=!spectator,dx=0,dy=0,dz=0] positioned ~-0.8 ~-0.8 ~-0.8 if entity @s[dx=0,dy=0,dz=0] run function gm4_monsters_unbound:mob/process/elite/pearlescent/lazer_damage

scoreboard players remove $lazer_limit gm4_mu_data 1
execute if score $lazer_limit gm4_mu_data matches 1.. positioned ^ ^ ^0.2 if block ~ ~ ~ #gm4:no_collision run function gm4_monsters_unbound:mob/process/elite/pearlescent/lazer_raycast
