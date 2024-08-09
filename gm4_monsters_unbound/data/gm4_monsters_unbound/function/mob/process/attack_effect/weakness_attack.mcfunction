# weaken players hit with weakness attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/weakness

effect give @s[tag=!gm4_mu_immune_weakness] weakness 15 0
effect give @s[tag=!gm4_mu_immune_hunger] hunger 15 1
