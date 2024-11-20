# slow players hit with slowing attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/slowing

effect give @s[tag=!gm4_ce_immune_slowness] slowness 15 0
