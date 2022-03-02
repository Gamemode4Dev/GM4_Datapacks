# run from armor/modifiers/activate_1

# modify attribute
execute store result score $operation gm4_ce_data run data get storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved_2}].Operation
execute if score $operation gm4_ce_data matches 0 run data modify storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved_2}].Amount set from storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2
execute if score $operation gm4_ce_data matches 1.. store result storage gm4_combat_evolved:temp tag.AttributeModifiers[{Name:gm4_combat_evolved_2}].Amount float 0.01 run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2
