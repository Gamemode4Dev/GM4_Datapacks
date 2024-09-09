# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_augmented_armor:damage_taken/augment/reactive

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# add level of absorption to player total for each armor piece
scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:reactive} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $absorption_level gm4_aa_data = $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:reactive} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $absorption_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:reactive} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $absorption_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:reactive} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $absorption_level gm4_aa_data += $level gm4_aa_data

# cooldown
scoreboard players set @s gm4_aa_t_reactive 37

# remove one to match absorption level and store
execute store result storage gm4_augmented_armor:temp player_shield.shield int 1 run scoreboard players remove $absorption_level gm4_aa_data 1

# apply absorption
function gm4_augmented_armor:armor/augment/type/reactive/eval with storage gm4_augmented_armor:temp player_shield

# cleanup
data remove storage gm4_augmented_armor:temp player_shield.shield
