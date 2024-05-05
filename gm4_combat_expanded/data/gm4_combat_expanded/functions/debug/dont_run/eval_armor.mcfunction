execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_combat_expanded{identified:0}.armor_clamp run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:armor/material/iron/chest
data modify storage gm4_combat_expanded:temp components set from entity @s SelectedItem.components

function gm4_combat_expanded:identification/armor/randomize_stats
$loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp new_components set from block 29999998 1 7134 Items[{Slot:4b}].components

function gm4_combat_expanded:identification/armor/fix_components

# set components
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp components."minecraft:damage" set value 0

# modify armor
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify block 29999998 1 7134 Items[{Slot:0b}].components merge from storage gm4_combat_expanded:temp components
data modify block 29999998 1 7134 Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded merge from storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded
item replace entity @s weapon.mainhand from block 29999998 1 7134 container.0
data remove block 29999998 1 7134 Items
data remove storage gm4_combat_expanded:temp components
