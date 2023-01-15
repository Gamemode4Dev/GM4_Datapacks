# weaken players hit with weakness attack
# @s = player that was hit
# at world spawn
# run from advancement damaged/mob/weakness

advancement revoke @s only gm4_combat_expanded:damaged/mob/weakness

effect give @s[scores={gm4_ce_difficult=..3},tag=!gm4_ce_immune_weakness] weakness 5 0
effect give @s[scores={gm4_ce_difficult=4..8},tag=!gm4_ce_immune_weakness] weakness 10 0
effect give @s[scores={gm4_ce_difficult=9..},tag=!gm4_ce_immune_weakness] weakness 30 0

effect give @s[scores={gm4_ce_difficult=..3},tag=!gm4_ce_immune_hunger] hunger 5 0
effect give @s[scores={gm4_ce_difficult=4..8},tag=!gm4_ce_immune_hunger] hunger 10 0
effect give @s[scores={gm4_ce_difficult=9..},tag=!gm4_ce_immune_hunger] hunger 30 0
