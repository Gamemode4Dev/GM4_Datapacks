# check unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_modifier/equip

execute store result score $stored_armor gm4_ae_data run data get storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.stored_armor

execute unless score @s gm4_ae_armor = $stored_armor gm4_ae_data run function gm4_armor_expanded:armor/modifier/type/unburden/update
