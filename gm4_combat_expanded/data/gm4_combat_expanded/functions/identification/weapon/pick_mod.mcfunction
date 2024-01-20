# identify weapon on the ground
# @s = unidentified item
# at unspecified
# run from identification/prep

# randomize stats
function gm4_combat_expanded:identification/weapon/randomize_stats

# get a random modifier and apply it to the storage, run as @p to make predicates work
# tag merge is also run from that location to match the dimension
execute as @p at @s run loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/random
execute as @p at @s run data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:1b}].tag

# check sharpness level
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness

# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# remove durability damage taken
data modify storage gm4_combat_expanded:temp tag.Damage set value 0
