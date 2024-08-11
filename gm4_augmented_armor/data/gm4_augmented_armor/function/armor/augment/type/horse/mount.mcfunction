# give mount speed and secondary effects
# @s = vehicle of player with armor
# at @s
# run from armor/check_augment/equip

# apply secondary effects
execute store result score $level_2 gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[1]
execute if score $level_2 gm4_aa_data matches 1 run effect give @s resistance 3 1 true
execute if score $level_2 gm4_aa_data matches 2 run effect give @s jump_boost 3 1 true
execute if score $level_2 gm4_aa_data matches 3 run effect give @s fire_resistance 3 0 true
execute if score $level_2 gm4_aa_data matches 4 run effect give @s regeneration 3 0 true

# add levels among pieces and store to mount
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:74} store result score $level_add gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level_add gm4_aa_data matches 3 run scoreboard players set $level_add gm4_aa_data 4
scoreboard players operation @s gm4_aa_horse.speed_level += $level_add gm4_aa_data

execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:74} store result score $level_add gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level_add gm4_aa_data matches 3 run scoreboard players set $level_add gm4_aa_data 4
scoreboard players operation @s gm4_aa_horse.speed_level += $level_add gm4_aa_data

execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:74} store result score $level_add gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level_add gm4_aa_data matches 3 run scoreboard players set $level_add gm4_aa_data 4
scoreboard players operation @s gm4_aa_horse.speed_level += $level_add gm4_aa_data

execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:74} store result score $level_add gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level_add gm4_aa_data matches 3 run scoreboard players set $level_add gm4_aa_data 4
scoreboard players operation @s gm4_aa_horse.speed_level += $level_add gm4_aa_data
