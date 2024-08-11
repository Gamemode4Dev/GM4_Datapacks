# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_augment/hp_check

# check player health and (de)activate armor if needed
execute if score $active gm4_aa_data matches 1 if score @s gm4_sr_health.current > @s gm4_sr_health.max_half run function gm4_augmented_armor:armor/augment/type/berserk/deactivate
execute if score $active gm4_aa_data matches 0 if score @s gm4_sr_health.current <= @s gm4_sr_health.max_half run function gm4_augmented_armor:armor/augment/type/berserk/activate
