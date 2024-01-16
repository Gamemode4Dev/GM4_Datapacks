
execute if data storage gm4_combat_expanded:temp Items[0].tag.gm4_combat_expanded{modifier:sword_ring} run data modify storage gm4_combat_expanded:temp sword_ring.data append from storage gm4_combat_expanded:temp Items[0]
data remove storage gm4_combat_expanded:temp Items[0]
execute if data storage gm4_combat_expanded:temp Items[0] run function gm4_combat_expanded:armor/modifier/type/sword_ring/get_relevant_data
