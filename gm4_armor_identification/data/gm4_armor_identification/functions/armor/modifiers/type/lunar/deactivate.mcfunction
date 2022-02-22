# run from armor/modifiers/type/lunar/check
# @s = player wearing lunar armour at day

# mark for change and set to inactive
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 0
data modify storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification_lunar}].Amount set value 0
