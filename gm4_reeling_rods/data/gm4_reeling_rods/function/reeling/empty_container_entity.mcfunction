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
execute store result score $motionX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp motion_vector[0] 100
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp motion_vector[1] 100
execute store result score $motionZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp motion_vector[2] 100
execute store result score $randomX gm4_reeling_rods.math run random value -10..10
execute store result score $randomY gm4_reeling_rods.math run random value 0..10
execute store result score $randomZ gm4_reeling_rods.math run random value -10..10
execute store result storage gm4_reeling_rods:temp item_data.Motion[0] double 0.006 run \
  scoreboard players operation $motionX gm4_reeling_rods.math += $randomX gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[1] double 0.006 run \
  scoreboard players operation $motionY gm4_reeling_rods.math += $randomY gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[2] double 0.006 run \
  scoreboard players operation $motionZ gm4_reeling_rods.math += $randomZ gm4_reeling_rods.math
# scale 0.01 for same magnitude as main item, currently 0.006 to be slower

# summon item with data
function gm4_reeling_rods:summon_item with storage gm4_reeling_rods:temp

# remove processed item
data remove storage gm4_reeling_rods:temp entity_data.Items[0]

# run again if needed
execute if data storage gm4_reeling_rods:temp entity_data.Items[] run function gm4_reeling_rods:reeling/empty_container_entity
