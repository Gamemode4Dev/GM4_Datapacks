# show a particle ring for gargantuan elite ground slam
# @s = gargantuan elite
# at @s
# run from mob/process/elite/gargantuan/process
# run from here

particle block{block_state:"chest"} ^ ^0.2 ^7 0.15 0.15 0.15 0.5 2
particle block{block_state:"chest"} ^ ^0.4 ^7 0.15 0.15 0.15 0.5 2
particle block{block_state:"chest"} ^ ^0.6 ^7 0.15 0.15 0.15 0.5 2

scoreboard players remove $particle_ring gm4_mu_data 1
execute if score $particle_ring gm4_mu_data matches 1.. rotated ~5 ~ run function gm4_monsters_unbound:mob/process/elite/gargantuan/particle_ring
