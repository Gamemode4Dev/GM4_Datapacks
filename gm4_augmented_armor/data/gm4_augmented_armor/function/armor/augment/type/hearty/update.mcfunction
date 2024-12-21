# update hearty armor
# @s = player wearing hearty armor
# at @s
# run from advancement augment/wear_hearty

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# head
scoreboard players set $change gm4_aa_data 0
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:0b}].components
scoreboard players set $slot gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} run function gm4_augmented_armor:armor/augment/type/hearty/calc_conversion
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/head_update with storage gm4_augmented_armor:temp
data remove storage gm4_augmented_armor:temp components

# chest
scoreboard players set $change gm4_aa_data 0
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:1b}].components
scoreboard players set $slot gm4_aa_data 1
execute if data storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} run function gm4_augmented_armor:armor/augment/type/hearty/calc_conversion
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/chest_update with storage gm4_augmented_armor:temp
data remove storage gm4_augmented_armor:temp components

# legs
scoreboard players set $change gm4_aa_data 0
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:2b}].components
scoreboard players set $slot gm4_aa_data 2
execute if data storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} run function gm4_augmented_armor:armor/augment/type/hearty/calc_conversion
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/legs_update with storage gm4_augmented_armor:temp
data remove storage gm4_augmented_armor:temp components

# feet
scoreboard players set $change gm4_aa_data 0
data modify storage gm4_augmented_armor:temp components set from storage gm4_augmented_armor:temp Items[{Slot:3b}].components
scoreboard players set $slot gm4_aa_data 3
execute if data storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor{augment:{name:hearty}} run function gm4_augmented_armor:armor/augment/type/hearty/calc_conversion
execute if score $change gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/feet_update with storage gm4_augmented_armor:temp
data remove storage gm4_augmented_armor:temp components

# revoke advancement at the end to not trigger from changes made
advancement revoke @s only gm4_augmented_armor:augment/hearty_wear

# cleanup
data remove storage gm4_augmented_armor:temp Items
