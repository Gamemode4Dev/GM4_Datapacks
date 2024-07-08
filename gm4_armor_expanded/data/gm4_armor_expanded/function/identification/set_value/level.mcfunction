# put level in item data
# @s = unidentified item
# at @s
# run from identification/fix_components

execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level:"armor"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level set from storage gm4_armor_expanded:temp armor
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level:"damage"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level set from storage gm4_armor_expanded:temp damage
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level:"level"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level set from storage gm4_armor_expanded:temp level
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level:"speed"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level set from storage gm4_armor_expanded:temp speed
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level:"atkspeed"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level set from storage gm4_armor_expanded:temp atkspeed
