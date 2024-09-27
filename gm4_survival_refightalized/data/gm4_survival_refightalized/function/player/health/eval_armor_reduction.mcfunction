# reduce armor on player based on their score
# @s = damaged player
# at @s
# run from player/health/damaged/calculate_reduction
# run from player/health/regain_armor

attribute @s generic.armor modifier remove gm4_survival_refightalized:armor_reduced
$attribute @s generic.armor modifier add gm4_survival_refightalized:armor_reduced -$(armor_reduction) add_value
tag @s add gm4_sr_armor_reduced
