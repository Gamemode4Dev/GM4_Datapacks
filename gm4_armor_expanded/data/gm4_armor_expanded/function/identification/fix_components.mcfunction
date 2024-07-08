# fix attributes on new item
# @s = unidentified item
# at @s
# run from identification/run

execute store result score $set_slot gm4_ae_data run data get storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.slot
execute if score $set_slot gm4_ae_data matches 0 run data modify storage gm4_armor_expanded:temp new_components.set_slot set value "head"
execute if score $set_slot gm4_ae_data matches 1 run data modify storage gm4_armor_expanded:temp new_components.set_slot set value "chest"
execute if score $set_slot gm4_ae_data matches 2 run data modify storage gm4_armor_expanded:temp new_components.set_slot set value "legs"
execute if score $set_slot gm4_ae_data matches 3 run data modify storage gm4_armor_expanded:temp new_components.set_slot set value "feet"

# merge components from base item
data modify storage gm4_armor_expanded:temp new_components."minecraft:damage" merge from storage gm4_armor_expanded:temp components."minecraft:damage"
data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers append from storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[]
data modify storage gm4_armor_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_armor_expanded:temp components."minecraft:enchantments"
# set slots for attribute_modifiers
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_2"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_2"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_3"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_3"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_4"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_4"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_5"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_5"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_6"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_6"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_7"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_7"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_8"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_8"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_9"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:permanent_9"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_2"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_2"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_3"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_3"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
execute if data storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_4"}] run data modify storage gm4_armor_expanded:temp new_components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_4"}].slot set from storage gm4_armor_expanded:temp new_components.set_slot
# set levels from storages
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level run function gm4_armor_expanded:identification/set_value/level
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level2 run function gm4_armor_expanded:identification/set_value/level2
execute if data storage gm4_armor_expanded:temp new_components."minecraft:custom_data".gm4_armor_expanded.level3 run function gm4_armor_expanded:identification/set_value/level3
