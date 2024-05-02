execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_combat_expanded{identified:0}.armor_clamp run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:armor/material/iron/chest
data modify storage gm4_combat_expanded:temp components set from entity @s SelectedItem.components

function gm4_combat_expanded:identification/armor/randomize_stats
$loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp components merge from block 29999998 1 7134 Items[{Slot:4b}].components
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp components."minecraft:damage" set value 0

item modify entity @s weapon.mainhand gm4_combat_expanded:identify_mainhand
data remove block 29999998 1 7134 Items
