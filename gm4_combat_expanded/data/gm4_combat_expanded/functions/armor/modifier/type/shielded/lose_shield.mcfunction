# remove player absorption when hit
# @s = player wearing shielded armor being damaged
# at @s
# run from advancement damaged/armor/shielded

advancement revoke @s only gm4_combat_expanded:damaged/armor/shielded

effect clear @s absorption

# put effect on cooldown
scoreboard players set @s gm4_ce_t_shield 5
