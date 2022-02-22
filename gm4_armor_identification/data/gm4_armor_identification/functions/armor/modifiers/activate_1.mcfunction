# run from any armor/modifiers/type/TYPE

# mark for change and set to active
scoreboard players set $change gm4_ai_data 1
data modify storage gm4_armor_identification:temp tag.gm4_armor_identification.active set value 1

# modify attribute
execute store result score $operation gm4_ai_data run data get storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification}].Operation
execute if score $operation gm4_ai_data matches 0 run data modify storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification}].Amount set from storage gm4_armor_identification:temp tag.gm4_armor_identification.level
execute if score $operation gm4_ai_data matches 1.. store result storage gm4_armor_identification:temp tag.AttributeModifiers[{Name:gm4_armor_identification}].Amount float 0.01 run data get storage gm4_armor_identification:temp tag.gm4_armor_identification.level

# check for second attribute
execute if data storage gm4_armor_identification:temp tag.gm4_armor_identification.level2 run function gm4_armor_identification:armor/modifiers/activate_2
