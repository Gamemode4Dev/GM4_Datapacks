
# merge components from base item
data modify storage gm4_combat_expanded:temp new_components."minecraft:damage" merge from storage gm4_combat_expanded:temp components."minecraft:damage"
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".modifiers append from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[]
data modify storage gm4_combat_expanded:temp new_components."minecraft:enchantments" merge from storage gm4_combat_expanded:temp components."minecraft:enchantments"
# set levels from storages
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level run function gm4_combat_expanded:identification/weapon/set_value/level
execute if data storage gm4_combat_expanded:temp new_components."minecraft:custom_data".gm4_combat_expanded.level2 run function gm4_combat_expanded:identification/weapon/set_value/level2

# hide tooltip
data modify storage gm4_combat_expanded:temp new_components."minecraft:attribute_modifiers".show_in_tooltip set value 0b
