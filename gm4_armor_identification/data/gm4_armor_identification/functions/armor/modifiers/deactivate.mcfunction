# run from any armor/modifiers/type/TYPE

# mark for change and set to inactive
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 0

# disable attributes
data modify storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification}].Amount set value 0
execute if data storage gm4_armor_identification:temp tag.gm4_armor_identification.level2 run data modify storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification_2}].Amount set value 0
