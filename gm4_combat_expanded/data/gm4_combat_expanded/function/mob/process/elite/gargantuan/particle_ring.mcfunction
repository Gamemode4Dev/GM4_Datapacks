
particle block{block_state:"chest"} ^ ^0.2 ^7 0.15 0.15 0.15 0.5 2
particle block{block_state:"chest"} ^ ^0.4 ^7 0.15 0.15 0.15 0.5 2
particle block{block_state:"chest"} ^ ^0.6 ^7 0.15 0.15 0.15 0.5 2

scoreboard players remove $particle_ring gm4_ce_data 1
execute if score $particle_ring gm4_ce_data matches 1.. rotated ~5 ~ run function gm4_combat_expanded:mob/process/elite/gargantuan/particle_ring
