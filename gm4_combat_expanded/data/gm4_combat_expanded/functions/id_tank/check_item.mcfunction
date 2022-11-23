# check if item needs to be identified
# @s = liquid tank marker
# at @s
# run from id_tank/item_fill

# set needed data to storage
data modify storage gm4_combat_expanded:temp tag set from storage gm4_liquid_tanks:temp/tank input_slot.tag

# check if the item is armor or weapon
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.unidentified run function gm4_combat_expanded:id_tank/armor
execute if data storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier run function gm4_combat_expanded:id_tank/weapon
