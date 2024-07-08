# deactivate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/modifier/type/acrobatic/check

# mark for change and set to inactive
scoreboard players set $change gm4_ae_data 1
data modify storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.active set value 0

# disable attribute
data modify storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic"}].amount set value 0
