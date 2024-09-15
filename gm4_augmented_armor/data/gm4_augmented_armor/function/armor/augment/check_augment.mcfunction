# check the augment on the armor piece
# @s = player wearing modified armor
# at unspecified
# run from functions in armor/slot/<SLOT>

# store active information
execute store result score $active gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.active

function gm4_survival_refightalized:player/health/calculate_hp

execute if score $augment gm4_aa_data matches 101 run function gm4_augmented_armor:armor/augment/type/acrobatic/check
execute if score $augment gm4_aa_data matches 102 run function gm4_augmented_armor:armor/augment/type/vigorous/get_immunities
execute if score $augment gm4_aa_data matches 103 if score @s gm4_aa_kill matches 1.. at @s run function gm4_augmented_armor:armor/augment/type/totem/activate
execute if score $augment gm4_aa_data matches 104 run function gm4_augmented_armor:armor/augment/type/gleaming/process
