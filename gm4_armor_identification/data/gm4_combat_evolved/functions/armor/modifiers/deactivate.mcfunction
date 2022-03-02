# run from any armor/modifiers/type/TYPE

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.active set value 0

# disable attributes
data modify storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved}].Amount set value 0
execute if data storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2 run data modify storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved_2}].Amount set value 0
