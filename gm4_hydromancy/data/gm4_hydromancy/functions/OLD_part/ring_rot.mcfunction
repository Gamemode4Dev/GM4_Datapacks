
scoreboard players remove $firework.particle_ring_rot gm4_hy_data 1

particle rain ^ ^ ^2.5 0.1 0.1 0.1 0 3
particle rain ^ ^ ^-2.5 0.1 0.1 0.1 0 3

execute if score $firework.particle_ring_rot gm4_hy_data = $firework.particle_ring_blade gm4_hy_data positioned ^ ^ ^-2.5 run function gm4_hydromancy:spell_trident/firework/particles/ring_blade
execute if score $firework.particle_ring_rot gm4_hy_data matches 1.. rotated ~ ~10 run function gm4_hydromancy:spell_trident/firework/particles/ring_rot
