
scoreboard players remove $reach gm4_aa_data 5
execute if score $reach gm4_aa_data matches 5.. positioned ^ ^ ^0.5 run return run function gm4_augmented_armor:armor/augment/type/gleaming/process/particle_ring_particle

particle dust{color:[1.000,1.000,1.000],scale:0.25} ^ ^1.15 ^ 0 0 0 0 1
execute if score $particle_ring_hide gm4_aa_data < $particle_ring gm4_aa_data run particle dust{color:[1.000,1.000,1.000],scale:1} ^ ^1.2 ^ 0.025 0.025 0.025 0 1
