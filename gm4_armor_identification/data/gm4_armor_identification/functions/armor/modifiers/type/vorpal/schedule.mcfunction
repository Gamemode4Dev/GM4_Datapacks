# run from advancement vorpal_damaged
# @s = player wearing vorpal armor being damaged
# at @s

advancement revoke @s only gm4_armor_identification:vorpal_damaged

tag @s add gm4_ai_vorpal_start
schedule function gm4_armor_identification:armor/modifiers/type/vorpal/context 1t
