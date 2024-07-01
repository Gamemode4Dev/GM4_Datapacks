# weaken players hit with weakness attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/weakness

effect give @s[tag=!gm4_ce_immune_weakness] weakness 15 0
effect give @s[tag=!gm4_ce_immune_hunger] hunger 15 1
