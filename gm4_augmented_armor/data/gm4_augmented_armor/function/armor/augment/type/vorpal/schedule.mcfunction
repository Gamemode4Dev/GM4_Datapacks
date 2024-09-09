# activate vorpal armor when player is damaged
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_augmented_armor:damage_taken/augment/vorpal

tag @s add gm4_aa_vorpal_start
schedule function gm4_augmented_armor:armor/augment/type/vorpal/context 1t
