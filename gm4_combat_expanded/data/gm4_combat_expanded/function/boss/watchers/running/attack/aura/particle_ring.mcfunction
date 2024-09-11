
particle smoke ^ ^ ^5 0.25 0.25 0.25 0.05 4

scoreboard players remove $particle_ring gm4_ce_boss 1
execute if score $particle_ring gm4_ce_boss matches 1.. rotated ~4 ~ run function gm4_combat_expanded:boss/watchers/running/attack/aura/particle_ring
