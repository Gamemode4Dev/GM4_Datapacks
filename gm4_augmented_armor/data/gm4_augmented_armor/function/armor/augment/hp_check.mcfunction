# check the augment on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/augment/check_augment

function gm4_survival_refightalized:player/calculate_hp

# low hp
execute if score $augment gm4_aa_data matches 43 run function gm4_augmented_armor:armor/augment/type/soothe/check
execute if score $augment gm4_aa_data matches 44 run function gm4_augmented_armor:armor/augment/type/berserk/check
execute if score $augment gm4_aa_data matches 45 if score @s gm4_aa_health.current <= @s gm4_aa_health.max_half run function gm4_augmented_armor:armor/augment/type/sustain/activate
execute if score $augment gm4_aa_data matches 51 if score @s gm4_aa_health.current <= @s gm4_aa_health.max_half run function gm4_augmented_armor:armor/augment/type/immune/get_immunities
# either
execute if score $augment gm4_aa_data matches 49 run function gm4_augmented_armor:armor/augment/type/poised/check
# high hp
execute if score $augment gm4_aa_data matches 52 run function gm4_augmented_armor:armor/augment/type/half/apply
