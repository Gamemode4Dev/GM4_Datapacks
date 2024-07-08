# put level3 in item data
# @s = unidentified item
# at @s
# run from identification/fix_components

execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level3:"armor"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 set from storage gm4_armor_expanded:temp armor
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level3:"damage"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 set from storage gm4_armor_expanded:temp damage
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level3:"level"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 set from storage gm4_armor_expanded:temp level
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level3:"speed"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 set from storage gm4_armor_expanded:temp speed
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded{level3:"atkspeed"} run return run data modify storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 set from storage gm4_armor_expanded:temp atkspeed
