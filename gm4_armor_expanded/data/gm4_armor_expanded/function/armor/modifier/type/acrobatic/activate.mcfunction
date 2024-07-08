# activate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/modifier/type/acrobatic/check

# set fall damage reduction
# mark for change and set to active
scoreboard players set $change gm4_ae_data 1
data modify storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.active set value 1

# modify attribute
execute store result storage gm4_armor_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_armor_expanded:dynamic"}].amount float -0.1 run data get storage gm4_armor_expanded:temp components."minecraft:custom_data".gm4_armor_expanded.level2
