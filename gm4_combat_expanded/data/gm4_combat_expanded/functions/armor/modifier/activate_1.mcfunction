# activate the first modifier on the armor piece
# @s = player wearing the armor
# at world spawn
# run from functions in armor/modifier/type/ (not the folders)

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# modify attribute
execute store result score $operation gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Operation
execute if score $operation gm4_ce_data matches 0 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set from storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
execute if score $operation gm4_ce_data matches 1.. store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount float 0.01 run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# check for second attribute
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level2 run function gm4_combat_expanded:armor/modifier/activate_2
