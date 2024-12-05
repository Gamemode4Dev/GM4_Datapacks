
# | Arrow Damage
scoreboard players set $arrow_damage_change gm4_aa_data 0

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage.value
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage.value
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage.value
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

scoreboard players set $add_arrow_damage gm4_aa_data 0
execute store result score $add_arrow_damage gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.custom_attribute.arrow_damage.value
scoreboard players operation $arrow_damage_change gm4_aa_data += $add_arrow_damage gm4_aa_data

# add arrow damage to arrow /5 to go from percentage to value, make sure arrow damage is at least 1
scoreboard players operation $arrow_damage_change gm4_aa_data /= #5 gm4_aa_data
scoreboard players operation $arrow_damage gm4_sr_data += $arrow_damage_change gm4_aa_data
scoreboard players operation $arrow_damage gm4_sr_data > #1 gm4_aa_data
