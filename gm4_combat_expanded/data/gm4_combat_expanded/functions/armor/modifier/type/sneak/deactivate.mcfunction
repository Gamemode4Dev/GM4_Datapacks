# remove player sneaking shrink when hit
# @s = player wearing seanking armor being damaged
# at @s
# run from armor/modifier/type/sneak/sneak

# mark for change and set to inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active set value 0
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set value 0
