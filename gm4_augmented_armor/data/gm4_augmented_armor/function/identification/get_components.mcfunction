
# get levels for this augment, they are stored as the amount of items in slots
data remove block 29999998 1 7134 Items
loot insert 29999998 1 7134 loot gm4_augmented_armor:armor/identification/augment/acrobatic/levels

# store levels in storage and scores
data modify storage gm4_augmented_armor:temp augment.levels set value [0,0,0,0]
execute store result score $level_1 gm4_aa_data store result storage gm4_augmented_armor:temp augment.levels[0] int 1 run data get block 29999998 1 7134 Items[0].count
execute store result score $level_2 gm4_aa_data store result storage gm4_augmented_armor:temp augment.levels[1] int 1 run data get block 29999998 1 7134 Items[1].count
execute store result score $level_3 gm4_aa_data store result storage gm4_augmented_armor:temp augment.levels[2] int 1 run data get block 29999998 1 7134 Items[2].count
execute store result score $level_4 gm4_aa_data store result storage gm4_augmented_armor:temp augment.levels[3] int 1 run data get block 29999998 1 7134 Items[3].count

# get components to use for this item, run as player for components requiring resolution
execute as @p run loot replace block 29999998 1 7134 container.0 loot gm4_augmented_armor:armor/identification/augment/acrobatic/components
