# weaken players hit with poison attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/poison

effect give @s[tag=!gm4_ce_immune_poison] poison 15 0
effect give @s[tag=!gm4_ce_immune_nausea] nausea 15 0
