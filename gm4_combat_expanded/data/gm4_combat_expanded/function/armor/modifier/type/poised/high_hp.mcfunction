# activate the positive modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/modifier/type/poised/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 1

# modify attributes
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic"}].amount float -1 run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
data modify storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic_2"}].amount set from storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2
