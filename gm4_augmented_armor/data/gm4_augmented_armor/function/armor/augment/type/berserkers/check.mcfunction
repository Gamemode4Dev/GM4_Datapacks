# check if heal pulse is off cooldown
# @s = player wearing soothing armour
# at @s
# run from armor/check_augment/hp_check

# if armor broke within last 4 seconds double stats and don't disable them
execute unless score $active gm4_aa_data matches 2 if score @s gm4_aa_augment.berserkers.timer matches 1.. run function gm4_augmented_armor:armor/augment/type/berserkers/double
execute if score @s gm4_aa_augment.berserkers.timer matches 1.. run return 0

# check player armor and (de)activate armor if needed
execute unless score $active gm4_aa_data matches 0 if score @s gm4_sr_armor matches 1.. run function gm4_augmented_armor:armor/augment/type/berserkers/deactivate
execute unless score $active gm4_aa_data matches 1 unless score @s gm4_sr_armor matches 1.. run function gm4_augmented_armor:armor/augment/type/berserkers/activate
