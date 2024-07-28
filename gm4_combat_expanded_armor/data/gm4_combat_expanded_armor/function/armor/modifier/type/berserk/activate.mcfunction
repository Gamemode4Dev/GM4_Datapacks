# activate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from armor/modifier/type/berserk/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded_armor:temp components."minecraft:custom_data".gm4_combat_expanded_armor.active set value 1

# modify attributes
execute store result storage gm4_combat_expanded_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded_armor:dynamic"}].amount float 0.1 run data get storage gm4_combat_expanded_armor:temp components."minecraft:custom_data".gm4_combat_expanded_armor.level 10
execute store result storage gm4_combat_expanded_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded_armor:dynamic_2"}].amount float 0.01 run data get storage gm4_combat_expanded_armor:temp components."minecraft:custom_data".gm4_combat_expanded_armor.level2
execute store result storage gm4_combat_expanded_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded_armor:dynamic_3"}].amount float 0.01 run data get storage gm4_combat_expanded_armor:temp components."minecraft:custom_data".gm4_combat_expanded_armor.level3
data modify storage gm4_combat_expanded_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded_armor:dynamic_4"}].amount set value 0.1
