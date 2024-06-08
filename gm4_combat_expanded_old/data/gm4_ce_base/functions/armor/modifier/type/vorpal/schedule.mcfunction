# activate vorpal armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_ce_base:damaged/armor/vorpal

tag @s add gm4_ce_vorpal_start
schedule function gm4_ce_base:armor/modifier/type/vorpal/context 1t
