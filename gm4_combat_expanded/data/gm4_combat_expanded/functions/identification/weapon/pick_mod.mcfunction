# pick a random modifier for the current weapon and apply it
# @s = unidentified item
# at unspecified
# run from identification/prep

# randomize stats
function gm4_combat_expanded:identification/weapon/randomize_stats

# get a random modifier and apply it to the storage
execute store result score $identification_rarity gm4_ce_data run random value -89..10
loot replace block 29999998 1 7134 container.1 loot gm4_combat_expanded:weapon/identification/random
data modify storage gm4_combat_expanded:temp tag merge from block 29999998 1 7134 Items[{Slot:1b}].tag

# check sharpness level
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute if score $current_sharpness gm4_ce_data matches 1.. run function gm4_combat_expanded:weapon/update_sharpness

# mark as identified
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.identified set value 1

# remove durability damage taken
data modify storage gm4_combat_expanded:temp tag.Damage set value 0