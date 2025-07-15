# reduce armor on player based on their score
# @s = damaged player
# at @s
# run from player/armor/recharge
# run from player/damage/calculate_damage

attribute @s minecraft:armor modifier remove gm4_survival_refightalized:armor_reduced
$attribute @s armor modifier add gm4_survival_refightalized:armor_reduced -$(armor_reduction) add_value
tag @s add gm4_sr_armor.reduction
