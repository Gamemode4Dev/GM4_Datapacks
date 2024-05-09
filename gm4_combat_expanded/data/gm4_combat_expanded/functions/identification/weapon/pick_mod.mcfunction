# identify weapon on the ground
# @s = unidentified item
# at @s
# run from identification/prep

# randomize stats
function gm4_combat_expanded:identification/weapon/randomize_stats

# get a random modifier and apply it to the storage, run as @p to make predicates work
execute as @p run loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/random
data modify storage gm4_combat_expanded:temp new_components merge from block 29999998 1 7134 Items[{Slot:1b}].components

# fix components
function gm4_combat_expanded:identification/weapon/fix_components

# set components
data modify storage gm4_combat_expanded:temp components merge from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components

# check sharpness level
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:enchantments".levels."minecraft:sharpness"
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness
