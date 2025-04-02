
execute if score @s gm4_mu_data matches 2 run particle dust_color_transition{from_color:[0.667,0.000,0.667],scale:1,to_color:[0.000,0.000,0.000]} ^ ^ ^2.25 0 0 0 1 0 normal
execute if score @s gm4_mu_data matches 3 run particle dust_color_transition{from_color:[0.667,0.000,0.667],scale:1,to_color:[0.000,0.000,0.000]} ^ ^ ^2.5 0 0 0 1 0 normal
execute if score @s gm4_mu_data matches 4 run particle dust_color_transition{from_color:[0.667,0.000,0.667],scale:1,to_color:[0.000,0.000,0.000]} ^ ^ ^2.75 0 0 0 1 0 normal
execute if score @s gm4_mu_data matches 5 run particle dust_color_transition{from_color:[0.667,0.000,0.667],scale:1,to_color:[0.000,0.000,0.000]} ^ ^ ^3 0 0 0 1 0 normal


scoreboard players remove $particle_ring gm4_mu_data 6

execute if score $particle_ring gm4_mu_data matches 1.. rotated ~6 ~ run function gm4_monsters_unbound:mob/process/elite/volatile/pillar_particle_ring
