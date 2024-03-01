# identify armor on the ground
# @s = unidentified item
# at @s
# run from any identification/prep

# randomize stats
function gm4_combat_expanded:identification/armor/randomize_stats

# get material for use in lore
execute store result score $material gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.material

# get a random modifier and apply it to the storage, run as @p to make predicates work
# tag merge is also run from that location to match the dimension
execute as @p run loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/random
execute as @p run data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag


# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# remove durability damage taken
data modify storage gm4_combat_expanded:temp tag.Damage set value 0
