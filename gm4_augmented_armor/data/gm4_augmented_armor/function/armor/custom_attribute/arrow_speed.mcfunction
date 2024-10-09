
# | Arrow Speed
scoreboard players set $motion_reduction gm4_aa_data 0

scoreboard players set $add_motion_reduction gm4_aa_data 0
execute store result score $add_motion_reduction gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_speed.value
scoreboard players operation $motion_reduction gm4_aa_data += $add_motion_reduction gm4_aa_data

scoreboard players set $add_motion_reduction gm4_aa_data 0
execute store result score $add_motion_reduction gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_speed.value
scoreboard players operation $motion_reduction gm4_aa_data += $add_motion_reduction gm4_aa_data

scoreboard players set $add_motion_reduction gm4_aa_data 0
execute store result score $add_motion_reduction gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_speed.value
scoreboard players operation $motion_reduction gm4_aa_data += $add_motion_reduction gm4_aa_data

scoreboard players set $add_motion_reduction gm4_aa_data 0
execute store result score $add_motion_reduction gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_speed.value
scoreboard players operation $motion_reduction gm4_aa_data += $add_motion_reduction gm4_aa_data

# apply arrow speed if needed
execute unless score $motion_reduction gm4_aa_data matches 0 as @n[type=#gm4_survival_refightalized:arrow,tag=gm4_sr_current_arrow] run function gm4_augmented_armor:armor/modify_arrow_speed
