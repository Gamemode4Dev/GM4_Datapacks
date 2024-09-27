# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_augment/hp_check

# check player armor and (de)activate armor if needed
execute if score $active gm4_aa_data matches 0 if predicate gm4_augmented_armor:technical/under_negative_effect run function gm4_augmented_armor:armor/augment/type/gutsy/activate
execute if score $active gm4_aa_data matches 1 unless predicate gm4_augmented_armor:technical/under_negative_effect run function gm4_augmented_armor:armor/augment/type/gutsy/deactivate
