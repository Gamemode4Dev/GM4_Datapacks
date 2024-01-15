# remove max health modifier from this armor if link is off
# @s = player wearing link armor
# at unspecified
# run from armor/modifier/tye/link/activate

# mark for change
scoreboard players set $change gm4_ce_data 1

# set health modifier to 0
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount set value 0

