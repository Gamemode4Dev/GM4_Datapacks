# check the augment on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/augment/check_augment

execute if score $augment gm4_aa_data matches 71 run function gm4_augmented_armor:armor/augment/type/canine/check
execute if score $augment gm4_aa_data matches 74 on vehicle run function gm4_augmented_armor:armor/augment/type/horse/mount
execute if score $augment gm4_aa_data matches 75 run function gm4_augmented_armor:armor/augment/type/husk/apply
execute if score $augment gm4_aa_data matches 76 at @s run function gm4_augmented_armor:armor/augment/type/link/check
execute if score $augment gm4_aa_data matches 78 at @s run function gm4_augmented_armor:armor/augment/type/unburden/check
