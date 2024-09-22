
# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check each piece
scoreboard players set $regen_speed gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} store result score $regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $regen_speed gm4_aa_data matches 1.. run function gm4_augmented_armor:player/combat_regeneration/timer_reduction

scoreboard players set $regen_speed gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} store result score $regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $regen_speed gm4_aa_data matches 1.. run function gm4_augmented_armor:player/combat_regeneration/timer_reduction

scoreboard players set $regen_speed gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} store result score $regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $regen_speed gm4_aa_data matches 1.. run function gm4_augmented_armor:player/combat_regeneration/timer_reduction

scoreboard players set $regen_speed gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} store result score $regen_speed gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $regen_speed gm4_aa_data matches 1.. run function gm4_augmented_armor:player/combat_regeneration/timer_reduction
