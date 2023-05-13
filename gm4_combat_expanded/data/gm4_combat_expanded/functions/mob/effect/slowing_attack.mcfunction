# slow players hit with slowing attack
# @s = player that was hit
# at world spawn
# run from advancement damaged/mob/slowing

advancement revoke @s only gm4_combat_expanded:damaged/mob/slowing

effect give @s[scores={gm4_ce_difficult=..3}] slowness 15 0
effect give @s[scores={gm4_ce_difficult=4..8}] slowness 30 0
effect give @s[scores={gm4_ce_difficult=9..}] slowness 30 1
