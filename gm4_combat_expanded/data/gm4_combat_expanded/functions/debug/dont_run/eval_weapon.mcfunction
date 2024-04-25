execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_combat_expanded{identified:0}.damage run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/iron
data modify storage gm4_combat_expanded:temp components set from entity @s SelectedItem.components

function gm4_combat_expanded:identification/weapon/randomize_stats
$loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp components merge from block 29999998 1 7134 Items[{Slot:1b}].components
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:enchantments"."minecraft:sharpness"
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp components."minecraft:damage" set value 0

item modify entity @s weapon.mainhand gm4_combat_expanded:identify_mainhand
data remove block 29999998 1 7134 Items
