
# store correct armor item in storage
execute if score $slot gm4_aa_data matches 0 run item replace block 29999998 1 7134 container.0 from entity @s armor.head
execute if score $slot gm4_aa_data matches 1 run item replace block 29999998 1 7134 container.0 from entity @s armor.chest
execute if score $slot gm4_aa_data matches 2 run item replace block 29999998 1 7134 container.0 from entity @s armor.legs
execute if score $slot gm4_aa_data matches 3 run item replace block 29999998 1 7134 container.0 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp components set from block 29999998 1 7134 Items[{Slot:0b}].components
data remove block 29999998 1 7134 Items

# set cooldown of ~30 sec
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.cooldown set value 38

# apply change
execute if score $slot gm4_aa_data matches 0 run function gm4_augmented_armor:item_modify_eval/head_update with storage gm4_augmented_armor:temp
execute if score $slot gm4_aa_data matches 1 run function gm4_augmented_armor:item_modify_eval/chest_update with storage gm4_augmented_armor:temp
execute if score $slot gm4_aa_data matches 2 run function gm4_augmented_armor:item_modify_eval/legs_update with storage gm4_augmented_armor:temp
execute if score $slot gm4_aa_data matches 3 run function gm4_augmented_armor:item_modify_eval/feet_update with storage gm4_augmented_armor:temp

# cleanup
data remove storage gm4_augmented_armor:temp components
