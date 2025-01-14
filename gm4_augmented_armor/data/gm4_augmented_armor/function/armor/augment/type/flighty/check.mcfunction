
execute store result score $timer gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.timer
execute if score $timer gm4_aa_data matches -1 run return 0
execute store result score $gametime gm4_aa_data run time query gametime
execute if score $timer gm4_aa_data <= $gametime gm4_aa_data run function gm4_augmented_armor:armor/augment/type/flighty/remove
