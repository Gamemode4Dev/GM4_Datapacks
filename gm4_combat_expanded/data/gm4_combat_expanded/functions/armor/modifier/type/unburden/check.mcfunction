# check unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_modifier/equip

execute store result score $stored_armor gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.stored_armor

execute unless score @s gm4_ce_armor = $stored_armor gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/unburden/update
