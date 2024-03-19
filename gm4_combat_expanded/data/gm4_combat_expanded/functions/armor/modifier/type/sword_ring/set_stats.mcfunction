# set sword stats when player is not sneaking
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/prep

data modify storage gm4_combat_expanded:temp sword_ring.scale set value 1.0
data modify storage gm4_combat_expanded:temp sword_ring.height set value 1.1
data modify storage gm4_combat_expanded:temp sword_ring.offset set value 3.5
