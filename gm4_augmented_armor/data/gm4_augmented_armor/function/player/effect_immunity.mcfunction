# clear effects depending on player tags from armor
# @s = player with immunity
# at unspecified
advancement revoke @s only gm4_augmented_armor:effect_immunity

# clear effects
effect clear @s[tag=gm4_aa_effect_immunity.mining_fatigue] mining_fatigue
effect clear @s[tag=gm4_aa_effect_immunity.wither] wither
effect clear @s[tag=gm4_aa_effect_immunity.poison] poison

effect clear @s[tag=gm4_aa_effect_immunity.hunger] hunger
effect clear @s[tag=gm4_aa_effect_immunity.blind] blindness
effect clear @s[tag=gm4_aa_effect_immunity.nausea] nausea
effect clear @s[tag=gm4_aa_effect_immunity.weakness] weakness

effect clear @s[tag=gm4_aa_effect_immunity.levitation] levitation
effect clear @s[tag=gm4_aa_effect_immunity.slow_falling] slow_falling
effect clear @s[tag=gm4_aa_effect_immunity.slowness] slowness
