execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_combat_expanded{identified:0}.damage run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:weapon/sword/iron
data modify storage gm4_combat_expanded:temp components set from entity @s SelectedItem.components

function gm4_combat_expanded:identification/weapon/randomize_stats
$loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp new_components merge from block 29999998 1 7134 Items[{Slot:1b}].components

# merge components from base item
data modify storage gm4_combat_expanded:temp new_components."minecraft:damage" merge from storage gm4_combat_expanded:temp components."minecraft:damage"
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers" merge from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers"
data modify storage gm4_combat_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_combat_expanded:temp components."minecraft:enchantments"
# set levels from storages
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level run function gm4_combat_expanded:identification/weapon/set_value/level
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level2 run function gm4_combat_expanded:identification/weapon/set_value/level2

# set components
data modify storage gm4_combat_expanded:temp components set from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.identified set value 1
data modify storage gm4_combat_expanded:temp components."minecraft:damage" set value 0

# modify weapon
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify block 29999998 1 7134 Items[{Slot:0b}].components merge from storage gm4_combat_expanded:temp components
data modify block 29999998 1 7134 Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded merge from storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded
item replace entity @s weapon.mainhand from block 29999998 1 7134 container.0
data remove block 29999998 1 7134 Items
data remove storage gm4_combat_expanded:temp components

# sharpness
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:enchantments".levels."minecraft:sharpness"
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness
