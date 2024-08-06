# check the modifier on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from armor/modifier/check_modifier

function gm4_survival_refightalized:player/calculate_hp

# low hp
execute if score $modifier gm4_aa_data matches 43 run function gm4_augmented_armor:armor/modifier/type/soothe/check
execute if score $modifier gm4_aa_data matches 44 run function gm4_augmented_armor:armor/modifier/type/berserk/check
execute if score $modifier gm4_aa_data matches 45 if score @s gm4_aa_health.current <= @s gm4_aa_health.max_half run function gm4_augmented_armor:armor/modifier/type/sustain/activate
execute if score $modifier gm4_aa_data matches 51 if score @s gm4_aa_health.current <= @s gm4_aa_health.max_half run function gm4_augmented_armor:armor/modifier/type/immune/get_immunities
# either
execute if score $modifier gm4_aa_data matches 49 run function gm4_augmented_armor:armor/modifier/type/poised/check
# high hp
execute if score $modifier gm4_aa_data matches 52 run function gm4_augmented_armor:armor/modifier/type/half/apply
