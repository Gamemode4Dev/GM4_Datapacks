# activate the modifiers on the armor piece
# @s = player wearing the armor
# at unspecified
# run from armor/modifier/type/berserk/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# modify attributes
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount float 1 run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount float 0.01 run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_3}].Amount float 0.01 run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level3
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_4}].Amount set value 1
