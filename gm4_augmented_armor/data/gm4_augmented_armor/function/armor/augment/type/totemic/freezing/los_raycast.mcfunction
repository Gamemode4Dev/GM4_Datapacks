
scoreboard players add $ray_distance gm4_aa_data 1

# raycast failed
execute if block ~ ~ ~ #gm4:full_collision run return run tag @s add gm4_mu_tried
execute if score $ray_distance gm4_aa_data matches 160.. run return run tag @s add gm4_mu_tried

# target found
execute positioned ~-0.2 ~-0.2 ~-0.2 if entity @s[dx=0,dy=0,dz=0] positioned ~-0.6 ~-0.6 ~-0.6 if entity @s[dx=0,dy=0,dz=0] run return run function gm4_augmented_armor:armor/augment/type/totemic/freezing/found_target

# continue raycast
execute positioned ^ ^ ^0.1 run function gm4_augmented_armor:armor/augment/type/totemic/freezing/los_raycast