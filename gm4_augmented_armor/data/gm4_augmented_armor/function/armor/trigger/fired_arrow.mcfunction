# process a player that shot an arrow
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function mob/process/arrow/run

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check each piece
scoreboard players set $arrow_damage_change gm4_aa_data 0

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

# add arrow damage to arrow /5 to go from percentage to value
scoreboard players operation $arrow_damage_change gm4_aa_data /= #5 gm4_aa_data
scoreboard players operation $arrow_damage gm4_sr_data += $arrow_damage_change gm4_aa_data

# augments
execute if predicate gm4_augmented_armor:modified_armor/augment/archery run function gm4_augmented_armor:armor/augment/type/archery/find_arrow

# cleanup
data remove storage gm4_augmented_armor:temp Items
