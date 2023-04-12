
scoreboard players remove $heal.particle_ring gm4_hy_data 1

particle cloud ^ ^ ^8 0.25 0.25 0.25 0 1
particle cloud ^ ^ ^-8 0.25 0.25 0.25 0 1

execute if score $heal.particle_ring gm4_hy_data = $heal.cloud_rain gm4_hy_data positioned ^ ^ ^-8 run function gm4_hydromancy:spell_trident/heal/vfx/cloud_rain
execute if score $heal.particle_ring gm4_hy_data matches 1.. rotated ~10 ~ run function gm4_hydromancy:spell_trident/heal/vfx/cloud_ring
