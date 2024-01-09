# gives newly equipped a random unid (stored modifier), this does not identify that armor
# @s = unidentified item
# at unspecified
# run from any identification/prep

# randomize stats
function gm4_combat_expanded:identification/armor/randomize_stats

# get a random modifier and apply it to the storage
execute store result score $identification_rarity gm4_ce_data run random value -89..10
loot replace block 29999998 1 7134 container.4 loot gm4_combat_expanded:armor/identification/random
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:4b}].tag

# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# remove durability damage taken
data modify storage gm4_combat_expanded:temp tag.Damage set value 0
