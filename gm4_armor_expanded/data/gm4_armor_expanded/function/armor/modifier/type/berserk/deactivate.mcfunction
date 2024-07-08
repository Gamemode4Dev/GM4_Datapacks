# deactivate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from armor/modifier/type/berserk/check

# mark for change and set to inactive
scoreboard players set $change gm4_ae_data 1
data modify storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.active set value 0

# disable attributes
data modify storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic"}].amount set value 0
data modify storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_2"}].amount set value 0
data modify storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_3"}].amount set value 0
data modify storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic_4"}].amount set value 0
