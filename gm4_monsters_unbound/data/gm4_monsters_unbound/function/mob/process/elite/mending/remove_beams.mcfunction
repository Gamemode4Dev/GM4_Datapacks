# schedule to remove the healing beam
# @s = unspecified
# at unspecified
# schedule from mob/process/elite/mending/grow_beams_schedule

execute at @e[type=block_display,tag=gm4_mu_elite.mending_beam] run particle entity_effect{color:[0.973,0.141,0.137,1.00]} ~ ~ ~ 0.2 0.2 0.2 1 8 normal
kill @e[type=block_display,tag=gm4_mu_elite.mending_beam]
