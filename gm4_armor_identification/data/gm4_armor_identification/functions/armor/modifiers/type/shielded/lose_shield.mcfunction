# run from advancement shielded_damaged
# @s = player wearing shielded armor being damaged
# at @s

advancement revoke @s only gm4_armor_identification:shielded_damaged
scoreboard players set @s gm4_ai_t_shield 5

effect clear @s absorption
