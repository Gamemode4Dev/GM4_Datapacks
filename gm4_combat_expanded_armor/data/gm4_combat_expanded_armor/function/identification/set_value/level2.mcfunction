# put level2 in item data
# @s = unidentified item
# at @s
# run from identification/fix_components

execute if data storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor{level2:"armor"} run return run data modify storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor.level2 set from storage gm4_combat_expanded_armor:temp armor
execute if data storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor{level2:"damage"} run return run data modify storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor.level2 set from storage gm4_combat_expanded_armor:temp damage
execute if data storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor{level2:"level"} run return run data modify storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor.level2 set from storage gm4_combat_expanded_armor:temp level
execute if data storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor{level2:"speed"} run return run data modify storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor.level2 set from storage gm4_combat_expanded_armor:temp speed
execute if data storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor{level2:"atkspeed"} run return run data modify storage gm4_combat_expanded_armor:temp new_components."minecraft:custom_data".gm4_combat_expanded_armor.level2 set from storage gm4_combat_expanded_armor:temp atkspeed
