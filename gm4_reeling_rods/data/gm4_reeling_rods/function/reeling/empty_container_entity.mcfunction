# Loops through Items[] and creates an item entity for each item, setting a slightly random motion
# @s = entity with an Items[] tag
# at @s
# run from pull_items

# Assumptions
# | storage gm4_reeling_rods:temp motion_vector is a Motion[] vector that reaches player
# | in storage gm4_reeling_rods:temp entity_data is an Items[] array of item data objects

# pull item data to be processed
data modify storage gm4_reeling_rods:temp item_data.Item set from storage gm4_reeling_rods:temp entity_data.Items[0]

# randomize motion slightly....
data modify storage gm4_reeling_rods:temp item_data.Motion[0] set compute default float gm4_reeling_rods:container_entity_motion_offset/x
data modify storage gm4_reeling_rods:temp item_data.Motion[1] set compute default float gm4_reeling_rods:container_entity_motion_offset/y
data modify storage gm4_reeling_rods:temp item_data.Motion[2] set compute default float gm4_reeling_rods:container_entity_motion_offset/z

# summon item with data
function gm4_reeling_rods:summon_item with storage gm4_reeling_rods:temp

# remove processed item
data remove storage gm4_reeling_rods:temp entity_data.Items[0]

# run again if needed
execute if data storage gm4_reeling_rods:temp entity_data.Items[] run function gm4_reeling_rods:reeling/empty_container_entity
