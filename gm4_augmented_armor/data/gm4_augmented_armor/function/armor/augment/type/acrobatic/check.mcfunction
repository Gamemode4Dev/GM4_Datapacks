# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_augment/safety

# get immunities if player is safe
execute unless score @s gm4_aa_in_combat_timer matches 1.. run function gm4_augmented_armor:armor/augment/type/acrobatic/get_immunities

# activate armor if player is regenerating again
execute unless score @s gm4_aa_in_combat_timer matches 1.. if score $active gm4_aa_data matches 0 run function gm4_augmented_armor:armor/augment/type/acrobatic/activate

# otherwise deactivate armor
execute if score @s gm4_aa_in_combat_timer matches 1.. if score $active gm4_aa_data matches 1 run function gm4_augmented_armor:armor/augment/type/acrobatic/deactivate