# activate the negative modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from functions in armor/modifier/type/focus/check

# mark for change and set to -active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value -1

# modify attribute
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount float -0.5 run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level 1
