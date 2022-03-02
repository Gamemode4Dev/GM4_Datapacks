# run from advancement damaged/armor/shielded
# @s = player wearing shielded armor being damaged
# at @s

advancement revoke @s only gm4_combat_evolved:damaged/armor/shielded
scoreboard players set @s gm4_ce_t_shield 5

effect clear @s absorption
