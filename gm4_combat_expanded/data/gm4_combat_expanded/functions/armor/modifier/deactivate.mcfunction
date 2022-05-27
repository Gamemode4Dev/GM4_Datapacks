# deactivate the modifiers on the armor piece
# @s = player wearing the armor
# run from functions in armor/modifier/type/ (not the folders)

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0

# disable attributes
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set value 0
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount set value 0
