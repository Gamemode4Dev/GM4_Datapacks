execute unless data entity @s SelectedItem.components."minecraft:custom_data".gm4_combat_expanded{identified:0}.armor_clamp run loot replace entity @s weapon.mainhand loot gm4_combat_expanded:armor/material/iron/chest
data modify storage gm4_combat_expanded:temp components set from entity @s SelectedItem.components

function gm4_combat_expanded:identification/armor/randomize_stats
$loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/modifier/$(id)
data modify storage gm4_combat_expanded:temp new_components set from block 29999998 1 7134 Items[{Slot:4b}].components
# merge components from base item
data modify storage gm4_combat_expanded:temp new_components."minecraft:damage" merge from storage gm4_combat_expanded:temp components."minecraft:damage"
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers" merge from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers"
data modify storage gm4_combat_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_combat_expanded:temp components."minecraft:enchantments"
# set slots for attribute_modifiers
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm_2"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm_2"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_2"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_2"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_3"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_3"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_4"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded_4"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
# set levels from storages
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level run function gm4_combat_expanded:identification/armor/set_value/level
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level2 run function gm4_combat_expanded:identification/armor/set_value/level2
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level3 run function gm4_combat_expanded:identification/armor/set_value/level3

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
