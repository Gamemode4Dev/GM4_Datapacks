
# check each piece
scoreboard players set $add_armor_recharge gm4_aa_data 0
execute store result score $add_armor_recharge gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value
scoreboard players operation @s gm4_sr_stat.armor_recharge_change += $add_armor_recharge gm4_aa_data

scoreboard players set $add_armor_recharge gm4_aa_data 0
execute store result score $add_armor_recharge gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value
scoreboard players operation @s gm4_sr_stat.armor_recharge_change += $add_armor_recharge gm4_aa_data

scoreboard players set $add_armor_recharge gm4_aa_data 0
execute store result score $add_armor_recharge gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value
scoreboard players operation @s gm4_sr_stat.armor_recharge_change += $add_armor_recharge gm4_aa_data

scoreboard players set $add_armor_recharge gm4_aa_data 0
execute store result score $add_armor_recharge gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.armor_recharge.value
scoreboard players operation @s gm4_sr_stat.armor_recharge_change += $add_armor_recharge gm4_aa_data

scoreboard players set @s[scores={gm4_sr_stat.armor_recharge_change=..-101}] gm4_sr_stat.armor_recharge_change 100
