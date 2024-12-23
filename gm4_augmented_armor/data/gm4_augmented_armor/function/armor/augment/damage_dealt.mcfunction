# check the augment on the armor piece
# @s = player wearing modified armor
# at @s
# run from functions in armor/slot/<SLOT>

# store active information
execute store result score $active gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.active
execute store result score $augment gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.id

# run based on augment id
execute if score $augment gm4_aa_data matches 8 run function gm4_augmented_armor:armor/augment/type/sparking/damage_dealt
