# reduce natural regen timer
# @s = player wearing sustain armour below 50% health
# at unspecified
# run from armor/augment/clocked

scoreboard players remove @s[scores={gm4_aa_in_combat=1..}] gm4_aa_in_combat 2
tag @s[scores={gm4_aa_in_combat=..0}] add gm4_aa_sustain_active
