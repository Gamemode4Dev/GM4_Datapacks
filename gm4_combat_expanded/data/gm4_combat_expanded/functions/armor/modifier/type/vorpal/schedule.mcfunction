# activate vorpal armor when player is damaged
# @s = player wearing armor
# at @s
# run from advancement damaged/armor/vorpal

advancement revoke @s only gm4_combat_expanded:damaged/armor/vorpal

tag @s add gm4_ce_vorpal_start
schedule function gm4_combat_expanded:armor/modifier/type/vorpal/context 1t
