
$say $(pick)
# get levels for this augment, they are stored as the amount of items in slots
data remove block 29999998 1 7134 Items
$loot insert 29999998 1 7134 loot gm4_augmented_armor:armor/identification/augment/$(pick)/levels

# store levels in storage and scores
data modify storage gm4_augmented_armor:temp augment.levels set value [0,0,0,0]

execute store result score $level_1 gm4_aa_data run data get block 29999998 1 7134 Items[0].count
execute store result score $level_1_mult gm4_aa_data run data get block 29999998 1 7134 Items[0].components."minecraft:custom_data".gm4_augmented_armor.multiplier
execute unless score $level_1_mult gm4_aa_data matches 0..1 run scoreboard players operation $level_1 gm4_aa_data *= $level_1_mult gm4_aa_data
execute store result storage gm4_augmented_armor:temp augment.levels[0] int 1 run scoreboard players get $level_1 gm4_aa_data

execute store result score $level_2 gm4_aa_data run data get block 29999998 1 7134 Items[1].count
execute store result score $level_2_mult gm4_aa_data run data get block 29999998 1 7134 Items[1].components."minecraft:custom_data".gm4_augmented_armor.multiplier
execute unless score $level_2_mult gm4_aa_data matches 0..1 run scoreboard players operation $level_2 gm4_aa_data *= $level_2_mult gm4_aa_data
execute store result storage gm4_augmented_armor:temp augment.levels[1] int 1 run scoreboard players get $level_2 gm4_aa_data

execute store result score $level_3 gm4_aa_data run data get block 29999998 1 7134 Items[2].count
execute store result score $level_3_mult gm4_aa_data run data get block 29999998 1 7134 Items[2].components."minecraft:custom_data".gm4_augmented_armor.multiplier
execute unless score $level_3_mult gm4_aa_data matches 0..1 run scoreboard players operation $level_3 gm4_aa_data *= $level_3_mult gm4_aa_data
execute store result storage gm4_augmented_armor:temp augment.levels[2] int 1 run scoreboard players get $level_3 gm4_aa_data

execute store result score $level_4 gm4_aa_data run data get block 29999998 1 7134 Items[3].count
execute store result score $level_4_mult gm4_aa_data run data get block 29999998 1 7134 Items[3].components."minecraft:custom_data".gm4_augmented_armor.multiplier
execute unless score $level_4_mult gm4_aa_data matches 0..1 run scoreboard players operation $level_4 gm4_aa_data *= $level_4_mult gm4_aa_data
execute store result storage gm4_augmented_armor:temp augment.levels[3] int 1 run scoreboard players get $level_4 gm4_aa_data

# get components to use for this item, run as player for components requiring resolution
$execute as @p run loot replace block 29999998 1 7134 container.0 loot gm4_augmented_armor:armor/identification/augment/$(pick)/components
