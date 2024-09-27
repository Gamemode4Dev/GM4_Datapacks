# check the amount of arrows to spawn
# @s = player wearing archer armor shooting a (cross)bow
# at unspecified
# run from clocks/temp/archer

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# check amount of archer pieces
# original target is set to -1 as the first arrow does not need to be counted
scoreboard players set $archery_arrow_target gm4_aa_data -1

scoreboard players set $add_archery_arrows gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:archery}} store result score $add_archery_arrows gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[1]
scoreboard players operation $archery_arrow_target gm4_aa_data += $add_archery_arrows gm4_aa_data

scoreboard players set $add_archery_arrows gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:archery}} store result score $add_archery_arrows gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[1]
scoreboard players operation $archery_arrow_target gm4_aa_data += $add_archery_arrows gm4_aa_data

scoreboard players set $add_archery_arrows gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:archery}} store result score $add_archery_arrows gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[1]
scoreboard players operation $archery_arrow_target gm4_aa_data += $add_archery_arrows gm4_aa_data

scoreboard players set $add_archery_arrows gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:archery}} store result score $add_archery_arrows gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[1]
scoreboard players operation $archery_arrow_target gm4_aa_data += $add_archery_arrows gm4_aa_data

# spawn arrows
scoreboard players set $archery_arrow_fired gm4_aa_data 0
execute as @n[type=#gm4_survival_refightalized:arrow,tag=gm4_sr_current_arrow] at @s run function gm4_augmented_armor:armor/augment/type/archery/apply

# cleanup
data remove storage gm4_augmented_armor:temp Items
