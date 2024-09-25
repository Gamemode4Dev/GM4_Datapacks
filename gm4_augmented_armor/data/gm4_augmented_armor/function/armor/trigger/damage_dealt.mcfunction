# store armor information in storage and process them
# @s = player wearing armor with augments
# at @s
advancement revoke @s only gm4_augmented_armor:damage_dealt
# run from player/in_pvp

# store armor items to storage
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# process armor
scoreboard players set $trigger.damage_dealt gm4_aa_data 1
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.augment.triggers{damage_dealt:1} run function gm4_augmented_armor:armor/slot/head
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.augment.triggers{damage_dealt:1} run function gm4_augmented_armor:armor/slot/chest
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.augment.triggers{damage_dealt:1} run function gm4_augmented_armor:armor/slot/legs
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.augment.triggers{damage_dealt:1} run function gm4_augmented_armor:armor/slot/feet
scoreboard players set $trigger.damage_dealt gm4_aa_data 0

# cleanup
data remove storage gm4_augmented_armor:temp Items
