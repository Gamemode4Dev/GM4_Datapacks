
particle rain ~ ~ ~ 0.05 0.05 0.05 0 2
scoreboard players remove $firework.particle_ring_length gm4_hy_data 1
execute if score $firework.particle_ring_length gm4_hy_data matches 1.. positioned ^ ^ ^0.1 run function gm4_hydromancy:spell_trident/firework/particles/ring_blade
