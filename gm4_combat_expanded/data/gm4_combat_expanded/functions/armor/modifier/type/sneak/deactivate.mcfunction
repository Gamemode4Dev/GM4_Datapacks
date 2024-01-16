
# remove invisibility
effect clear @s invisibility

# mark as inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0
scoreboard players set $active gm4_ce_data 0

# remove attribute
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set value 0
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount set value 0
