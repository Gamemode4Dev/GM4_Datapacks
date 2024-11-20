# identify armor on the ground
# @s = unidentified item
# at @s
# run from any identification/prep

# get material for use in lore
execute store result score $material gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.material

# randomize stats
function gm4_combat_expanded:identification/armor/randomize_stats

# get material for use in lore
execute store result score $material gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.material

# get a random modifier and apply it to the storage, run as @p to make predicates work
execute as @p run loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/random
data modify storage gm4_combat_expanded:temp new_components set from block 29999998 1 7134 Items[{Slot:4b}].components

# fix components
function gm4_combat_expanded:identification/armor/fix_components

# set components
data modify storage gm4_combat_expanded:temp components merge from storage gm4_combat_expanded:temp new_components
data remove storage gm4_combat_expanded:temp new_components
