# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_modifier/hp_check

# check player health and (de)activate armor if needed
execute if score $active gm4_ae_data matches 1 if score @s gm4_ae_health.current > @s gm4_ae_health.max_half run function gm4_armor_expanded:armor/modifier/type/berserk/deactivate
execute if score $active gm4_ae_data matches 0 if score @s gm4_ae_health.current <= @s gm4_ae_health.max_half run function gm4_armor_expanded:armor/modifier/type/berserk/activate
