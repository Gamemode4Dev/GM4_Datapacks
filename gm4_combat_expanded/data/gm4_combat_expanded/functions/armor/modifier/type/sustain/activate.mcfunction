# reduce natural regen timer
# @s = player wearing sustain armour below 50% health
# at unspecified
# run from armor/modifier/check_modifier/hp_check

scoreboard players remove @s[scores={gm4_ce_natural_regen_damage=1..}] gm4_ce_natural_regen_damage 2
tag @s[scores={gm4_ce_natural_regen_damage=..0}] add gm4_ce_sustain_active
