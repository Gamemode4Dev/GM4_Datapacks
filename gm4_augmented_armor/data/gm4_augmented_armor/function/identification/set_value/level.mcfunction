# put level in item data
# @s = unidentified item
# at @s
# run from identification/fix_components

execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level:"armor"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level set from storage gm4_augmented_armor:temp armor
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level:"damage"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level set from storage gm4_augmented_armor:temp damage
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level:"level"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level set from storage gm4_augmented_armor:temp level
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level:"speed"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level set from storage gm4_augmented_armor:temp speed
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level:"atkspeed"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level set from storage gm4_augmented_armor:temp atkspeed
