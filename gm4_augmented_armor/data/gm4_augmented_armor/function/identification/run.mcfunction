# prepare identifying item
# @s = unidentified item
# at @s
# run from check_item

# put data in storage
data modify storage gm4_augmented_armor:temp components set from entity @s Item.components
# get material for use in lore
execute store result score $material gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.material
# randomize stats
function gm4_augmented_armor:identification/randomize_stats

# get a random modifier and apply it to the storage, run as @p to make predicates work
execute as @p run loot replace block 29999998 1 7134 container.0 loot gm4_augmented_armor:armor/identification/random
data modify storage gm4_augmented_armor:temp new_components set from block 29999998 1 7134 Items[{Slot:0b}].components

# fix components
function gm4_augmented_armor:identification/fix_components

# set components
data modify storage gm4_augmented_armor:temp components merge from storage gm4_augmented_armor:temp new_components
data modify storage test:test test set from storage gm4_augmented_armor:temp new_components
data remove storage gm4_augmented_armor:temp new_components

# mark as identified
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.identified set value 1

# remove durability damage taken
data modify storage gm4_augmented_armor:temp components."minecraft:damage" set value 0

# update item
data modify entity @s Item.components set from storage gm4_augmented_armor:temp components

# cleanup
data remove block 29999998 1 7134 Items
