# identify armor on the ground
# @s = unidentified item
# at @s
# run from any identification/prep

# get material for use in lore
execute store result score $material gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.material

# randomize stats
function gm4_combat_expanded:identification/armor/randomize_stats

# get a random modifier and apply it to the storage, run as @p to make predicates work
execute as @p run loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/random
data modify storage gm4_combat_expanded:temp new_components set from block 29999998 1 7134 Items[{Slot:4b}].components

# merge components from base item
data modify storage gm4_combat_expanded:temp new_components."minecraft:damage" merge from storage gm4_combat_expanded:temp components."minecraft:damage"
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers" merge from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers"
data modify storage gm4_combat_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_combat_expanded:temp components."minecraft:enchantments"
# set slots for attribute_modifiers
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
execute if data storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm_2"}] run data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_perm_2"}].slot set from storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor"}].slot
# set levels from storages
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level run function gm4_combat_expanded:identification/set_value/level

# set components
data modify storage gm4_combat_expanded:temp components merge from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components
