
scoreboard players remove $ray_distance_target gm4_aa_data 1

particle dust{color:[0.973,0.141,0.137],scale:1} ~ ~-0.5 ~ 0.15 0.15 0.15 0 1 normal

# continue raycast
execute if score $ray_distance_target gm4_aa_data matches 1.. positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totemic/healing/particle_raycast
