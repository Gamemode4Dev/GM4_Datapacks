# keep only data from sword_ring_armor
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/prep
# run from here

execute if data storage gm4_armor_expanded:temp Items[0].components."minecraft:custom_data".gm4_armor_expanded{modifier:sword_ring} run data modify storage gm4_armor_expanded:temp sword_ring.data append from storage gm4_armor_expanded:temp Items[0]
data remove storage gm4_armor_expanded:temp Items[0]
execute if data storage gm4_armor_expanded:temp Items[0] run function gm4_armor_expanded:armor/modifier/type/sword_ring/get_relevant_data