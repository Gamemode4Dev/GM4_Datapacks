# check the augment on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/augment/check_augment

# safe
execute if score $augment gm4_aa_data matches 10 run function gm4_augmented_armor:armor/augment/type/scout/check
execute if score $augment gm4_aa_data matches 11 unless score @s gm4_aa_in_combat_timer matches 1.. unless score @s gm4_aa_t_shield matches 1.. run function gm4_augmented_armor:armor/augment/type/shielded/add_level
execute if score $augment gm4_aa_data matches 12 run function gm4_augmented_armor:armor/augment/type/sneak/check
execute if score $augment gm4_aa_data matches 13 run function gm4_augmented_armor:armor/augment/type/focus/check
execute if score $augment gm4_aa_data matches 14 run function gm4_augmented_armor:armor/augment/type/acrobatic/check
# unsafe (most triggered from advancements)
execute if score $augment gm4_aa_data matches 21 run function gm4_augmented_armor:armor/augment/type/second_wind/check
