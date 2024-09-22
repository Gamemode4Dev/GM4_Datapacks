# check unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_augment/equip

execute store result score $stored_armor gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.stored_armor

execute unless score @s gm4_aa_stat.armor = $stored_armor gm4_aa_data run function gm4_augmented_armor:armor/augment/type/unburden/update
