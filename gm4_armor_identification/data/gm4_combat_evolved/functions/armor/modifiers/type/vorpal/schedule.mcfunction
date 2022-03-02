# run from advancement damaged/armor/vorpal
# @s = player wearing vorpal armor being damaged
# at @s

advancement revoke @s only gm4_combat_evolved:damaged/armor/vorpal

tag @s add gm4_ce_vorpal_start
schedule function gm4_combat_evolved:armor/modifiers/type/vorpal/context 1t
