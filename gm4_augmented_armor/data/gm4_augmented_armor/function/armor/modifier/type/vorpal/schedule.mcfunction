# activate vorpal armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_augmented_armor:damaged/armor/vorpal

tag @s add gm4_aa_vorpal_start
schedule function gm4_augmented_armor:armor/modifier/type/vorpal/context 1t
