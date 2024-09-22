
scoreboard players operation $reach gm4_aa_data = @s gm4_aa_augment.gleaming.reach
function gm4_augmented_armor:armor/augment/type/gleaming/process/particle_ring_particle

scoreboard players remove $particle_ring gm4_aa_data 1
execute if score $particle_ring gm4_aa_data matches 1.. rotated ~4 ~ run function gm4_augmented_armor:armor/augment/type/gleaming/process/particle_ring
