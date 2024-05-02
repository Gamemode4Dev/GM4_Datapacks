# identify weapon on the ground
# @s = unidentified item
# at @s
# run from identification/prep

# randomize stats
function gm4_combat_expanded:identification/weapon/randomize_stats

# get a random modifier and apply it to the storage, run as @p to make predicates work
execute as @p run loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/random
data modify storage gm4_combat_expanded:temp new_components merge from block 29999998 1 7134 Items[{Slot:1b}].components

# merge components from base item
data modify storage gm4_combat_expanded:temp new_components."minecraft:damage" merge from storage gm4_combat_expanded:temp components."minecraft:damage"
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers" merge from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers"
data modify storage gm4_combat_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_combat_expanded:temp components."minecraft:enchantments"
# set levels from storages
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level run function gm4_combat_expanded:identification/weapon/set_value/level
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level2 run function gm4_combat_expanded:identification/weapon/set_value/level2

# set components
data modify storage gm4_combat_expanded:temp components merge from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components

# check sharpness level
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:enchantments".levels."minecraft:sharpness"
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness
