
scoreboard players remove $ray_distance gm4_aa_data 1

particle dust{color:[0.545,0.686,0.878],scale:2} ~ ~ ~ 0.02 0.02 0.02 0 1 normal

# continue raycast
execute if score $ray_distance gm4_aa_data matches 1.. positioned ^ ^ ^-0.1 run function gm4_augmented_armor:armor/augment/type/totemic/freezing/particle_raycast
