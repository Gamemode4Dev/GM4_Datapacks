# check the augment on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/augment/check_augment

execute if score $augment gm4_aa_data matches 32 if score @s gm4_aa_kill matches 1.. run function gm4_augmented_armor:armor/augment/type/vamp/vamp
execute if score $augment gm4_aa_data matches 34 if score @s gm4_aa_kill matches 1.. at @s run function gm4_augmented_armor:armor/augment/type/totem/activate
execute if score $augment gm4_aa_data matches 35 run function gm4_augmented_armor:armor/augment/type/drain/check
execute if score $augment gm4_aa_data matches 36 if score @s gm4_aa_kill matches 1.. run function gm4_augmented_armor:armor/augment/type/burn/trigger_kill
execute if score $augment gm4_aa_data matches 37 run function gm4_augmented_armor:armor/augment/type/reckless/check
