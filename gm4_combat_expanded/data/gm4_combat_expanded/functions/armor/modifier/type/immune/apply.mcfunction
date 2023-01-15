# clear effects depending on player tags from armor
# @s = player wearing immune armour above 50% health
# at world spawn
# run from tick

# clear effects
effect clear @s[tag=gm4_ce_immune_fatigue] mining_fatigue
effect clear @s[tag=gm4_ce_immune_wither] wither
effect clear @s[tag=gm4_ce_immune_poison] poison

effect clear @s[tag=gm4_ce_immune_hunger] hunger
effect clear @s[tag=gm4_ce_immune_blind] blindness
effect clear @s[tag=gm4_ce_immune_nausea] nausea
effect clear @s[tag=gm4_ce_immune_weakness] weakness

