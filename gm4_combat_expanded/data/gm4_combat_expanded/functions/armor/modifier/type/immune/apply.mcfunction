# clear effects depending on player tags from armor
# @s = player wearing immune armour below 50% health
# at unspecified
advancement revoke @s only gm4_combat_expanded:effect_immunity

# clear effects
effect clear @s[tag=gm4_ce_immune_fatigue] mining_fatigue
effect clear @s[tag=gm4_ce_immune_wither] wither
effect clear @s[tag=gm4_ce_immune_poison] poison

effect clear @s[tag=gm4_ce_immune_hunger] hunger
effect clear @s[tag=gm4_ce_immune_blind] blindness
effect clear @s[tag=gm4_ce_immune_nausea] nausea
effect clear @s[tag=gm4_ce_immune_weakness] weakness
