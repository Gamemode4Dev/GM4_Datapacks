
particle rain ^ ^0.2 ^
scoreboard players remove $heal.particle_ring gm4_hy_data 1
execute if score $heal.particle_ring gm4_hy_data matches 1.. rotated ~10 ~ run function gm4_hydromancy:spell_trident/heal/vfx/trident_ring
