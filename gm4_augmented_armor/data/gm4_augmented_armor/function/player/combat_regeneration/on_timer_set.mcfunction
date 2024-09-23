# process a player that had their combat regeneration timer reset
# @s = player
# at @s
# run from player/combat_regeneration/on_apply
# run from player/damage_taken

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check each piece
scoreboard players set $regen_speed gm4_aa_data 0

execute store result score $add_regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed
scoreboard players operation $regen_speed gm4_aa_data += $add_regen_speed gm4_aa_data

execute store result score $add_regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed
scoreboard players operation $regen_speed gm4_aa_data += $add_regen_speed gm4_aa_data

execute store result score $add_regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed
scoreboard players operation $regen_speed gm4_aa_data += $add_regen_speed gm4_aa_data

execute store result score $add_regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.regen_speed
scoreboard players operation $regen_speed gm4_aa_data += $add_regen_speed gm4_aa_data

# cap regen speed reduction at -99%, otherwise the formula breaks
execute if score $regen_speed gm4_aa_data matches ..-100 run scoreboard players set $regen_speed gm4_aa_data -99
execute unless score $regen_speed gm4_aa_data matches 0 run function gm4_augmented_armor:player/combat_regeneration/timer_reduction
