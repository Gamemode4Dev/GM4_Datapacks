# slow players hit with slowing attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/slowing

effect give @s[scores={gm4_ce_difficult=..15}] slowness 15 0
effect give @s[scores={gm4_ce_difficult=16..40}] slowness 30 0
effect give @s[scores={gm4_ce_difficult=41..}] slowness 30 1