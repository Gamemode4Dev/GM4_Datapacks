# clear effects depending on player tags from armor
# @s = player with immunity
# at unspecified
advancement revoke @s only gm4_augmented_armor:effect_immunity

# clear effects
effect clear @s[tag=gm4_aa_immune_fatigue] mining_fatigue
effect clear @s[tag=gm4_aa_immune_wither] wither
effect clear @s[tag=gm4_aa_immune_poison] poison

effect clear @s[tag=gm4_aa_immune_hunger] hunger
effect clear @s[tag=gm4_aa_immune_blind] blindness
effect clear @s[tag=gm4_aa_immune_nausea] nausea
effect clear @s[tag=gm4_aa_immune_weakness] weakness

effect clear @s[tag=gm4_aa_immune_levitation] levitation
effect clear @s[tag=gm4_aa_immune_slow_falling] slow_falling
effect clear @s[tag=gm4_aa_immune_slowness] slowness
