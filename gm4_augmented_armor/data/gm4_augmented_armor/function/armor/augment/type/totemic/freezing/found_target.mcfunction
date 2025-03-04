
scoreboard players set $attempts_left gm4_aa_data 0

# make the particle raycast
execute positioned ~0.8 ~0.8 ~0.8 run function gm4_augmented_armor:armor/augment/type/totemic/freezing/particle_raycast

damage @s 0.01 freeze
effect give @s slowness 2 3
effect give @s weakness 2 3
