# runs commands for landed custom potion tracker markers
# @s = potion tracker marker
# located at @s
# run from gm4_potion_tracking-1.0:track/marker

# run commands
data modify storage gm4_potion_tracking:temp entity_data set from entity @s data.gm4_potion
function #gm4_potion_tracking:potion_landed

# clean up
data remove storage gm4_potion_tracking:temp entity_data
kill @s
