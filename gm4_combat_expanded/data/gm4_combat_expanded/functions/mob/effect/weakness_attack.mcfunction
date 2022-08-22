# weaken players hit with weakness attack
# @s = player that was hit
# at world spawn
# run from advancement damaged/mob/weakness

advancement revoke @s only gm4_combat_expanded:damaged/mob/weakness

effect give @s[scores={gm4_ce_difficult=..3}] weakness 15 0
effect give @s[scores={gm4_ce_difficult=4..8}] weakness 30 0
effect give @s[scores={gm4_ce_difficult=9..}] weakness 30 1
