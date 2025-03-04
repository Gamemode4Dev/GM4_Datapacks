# activate vorpal armor when player is damaged
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

# schedule a tick later, this also means vorpal cannot trigger twice
tag @s add gm4_aa_vorpal_start
schedule function gm4_augmented_armor:armor/augment/type/vorpal/context 1t replace
