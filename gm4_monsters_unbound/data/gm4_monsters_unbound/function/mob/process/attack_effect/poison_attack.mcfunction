# poison players hit with poison attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/poison

effect give @s[tag=!gm4_mu_immune_poison] poison 6 0
effect give @s[tag=!gm4_mu_immune_nausea] nausea 8 0
