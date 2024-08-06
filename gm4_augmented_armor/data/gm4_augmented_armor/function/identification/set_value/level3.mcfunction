# put level3 in item data
# @s = unidentified item
# at @s
# run from identification/fix_components

execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level3:"armor"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level3 set from storage gm4_augmented_armor:temp armor
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level3:"damage"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level3 set from storage gm4_augmented_armor:temp damage
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level3:"level"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level3 set from storage gm4_augmented_armor:temp level
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level3:"speed"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level3 set from storage gm4_augmented_armor:temp speed
execute if data storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor{level3:"atkspeed"} run return run data modify storage gm4_augmented_armor:temp new_components."minecraft:custom_data".gm4_augmented_armor.level3 set from storage gm4_augmented_armor:temp atkspeed
