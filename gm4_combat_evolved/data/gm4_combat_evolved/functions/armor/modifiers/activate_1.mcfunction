# activate the first modifier on the armor piece
# @s = player wearing the armor
# run from functions in armor/modifiers/type/ (not the folders)

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.active set value 1

# modify attribute
execute store result score $operation gm4_ce_data run data get storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved}].Operation
execute if score $operation gm4_ce_data matches 0 run data modify storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved}].Amount set from storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
execute if score $operation gm4_ce_data matches 1.. store result storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved}].Amount float 0.01 run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# check for second attribute
execute if data storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2 run function gm4_combat_evolved:armor/modifiers/activate_2
