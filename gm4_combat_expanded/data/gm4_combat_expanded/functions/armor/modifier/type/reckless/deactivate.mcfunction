# activate reckless armor on mob kill
# @s = player wearing armor
# at @s
# run from armor/modifier/killing

scoreboard players set $change gm4_ce_data 1

# reset level and modifiers
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set value 0
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount set value 0
