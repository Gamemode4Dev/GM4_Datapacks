# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

execute if score $modifier gm4_aa_data matches 71 run function gm4_augmented_armor:armor/modifier/type/canine/check
execute if score $modifier gm4_aa_data matches 74 on vehicle run function gm4_augmented_armor:armor/modifier/type/horse/mount
execute if score $modifier gm4_aa_data matches 75 run function gm4_augmented_armor:armor/modifier/type/husk/apply
execute if score $modifier gm4_aa_data matches 76 at @s run function gm4_augmented_armor:armor/modifier/type/link/check
execute if score $modifier gm4_aa_data matches 78 at @s run function gm4_augmented_armor:armor/modifier/type/unburden/check
