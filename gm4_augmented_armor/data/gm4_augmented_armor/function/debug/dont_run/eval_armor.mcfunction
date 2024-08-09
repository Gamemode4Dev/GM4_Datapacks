execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_augmented_armor{identified:0}.armor_clamp run loot replace entity @s weapon.mainhand loot gm4_augmented_armor:armor/material/iron/chest
data modify storage gm4_augmented_armor:temp components set from entity @s SelectedItem.components

function gm4_augmented_armor:identification/randomize_stats
$loot replace block 29999998 1 7134 container.4 loot gm4_augmented_armor:armor/identification/augment/$(id)
data modify storage gm4_augmented_armor:temp new_components set from block 29999998 1 7134 Items[{Slot:4b}].components

function gm4_augmented_armor:identification/fix_components

# set components
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp new_components
data remove storage gm4_augmented_armor:temp new_components
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.identified set value 1
data modify storage gm4_augmented_armor:temp components."minecraft:damage" set value 0

# modify armor
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify block 29999998 1 7134 Items[{Slot:0b}].components merge from storage gm4_augmented_armor:temp components
data modify block 29999998 1 7134 Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor merge from storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor
item replace entity @s weapon.mainhand from block 29999998 1 7134 container.0
data remove block 29999998 1 7134 Items
data remove storage gm4_augmented_armor:temp components
