# check the augment on the armor piece
# @s = player wearing modified armor
# at @s
# run from functions in armor/slot/<SLOT>

# store active information
execute store result score $active gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.active
execute store result score $augment gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.id

# run based on augment id
execute if score $augment gm4_aa_data matches 4 run function gm4_augmented_armor:armor/augment/type/acrobatic/check
execute if score $augment gm4_aa_data matches 5 run function gm4_augmented_armor:armor/augment/type/vigorous/get_immunities
execute if score $augment gm4_aa_data matches 6 if score @s gm4_aa_stat.kills matches 1.. run function gm4_augmented_armor:armor/augment/type/totemic/activate
execute if score $augment gm4_aa_data matches 7 if score @s gm4_aa_stat.damage_dealt matches 1.. run function gm4_augmented_armor:armor/augment/type/gleaming/prime/activate
