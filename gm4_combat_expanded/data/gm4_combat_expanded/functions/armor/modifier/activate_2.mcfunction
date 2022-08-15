# activate the second modifier on the armor piece
# @s = player wearing the armor
# at world spawn
# run from armor/modifier/activate_1

# modify attribute
execute store result score $operation gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Operation
execute if score $operation gm4_ce_data matches 0 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount set from storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2
execute if score $operation gm4_ce_data matches 1.. store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount float 0.01 run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2
