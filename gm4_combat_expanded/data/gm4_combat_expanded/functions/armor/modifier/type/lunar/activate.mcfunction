# grant player stats according to moon cycle
# @s = player wearing armour
# at world spawn
# run from armor/modifier/type/lunar/check

# mark for change and set to active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 1

# set stats according to moon cycle
execute if score $moon gm4_ce_data matches 0 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.1

execute if score $moon gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.05
execute if score $moon gm4_ce_data matches 7 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.05

execute if score $moon gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.025
execute if score $moon gm4_ce_data matches 6 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.025

execute if score $moon gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.01
execute if score $moon gm4_ce_data matches 5 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0.01

execute if score $moon gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_lunar}].Amount set value 0

# store moon cycle in nbt
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.moon int 1 run scoreboard players get $moon gm4_ce_data
