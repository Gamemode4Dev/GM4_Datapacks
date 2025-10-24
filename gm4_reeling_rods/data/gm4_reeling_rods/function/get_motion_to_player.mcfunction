# Gets motion vector to launch entity to player. X and Z motion is 10% the block distance between the player and current position. Y motion uses the sum of the squares of position deltas as a lookup table key, the value of which is added to the Y position delta to get the Y motion.
# @s = entity with items to be yoinked
# at bobber in @s (most of the time)
# run from pull_items

data modify storage gm4_reeling_rods:temp item_data.Motion set value [0d,0d,0d]

# Store current position
execute summon marker run function gm4_reeling_rods:get_execution_pos
# | position stored in storage gm4_reeling_rods:temp position
execute store result score $currentX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp position[0] 1
execute store result score $currentY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp position[1] 1
execute store result score $currentZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp position[2] 1

# Player postion is stored in $motionX... ect from player/find_hooked_entity

# Get distance from current position to player
scoreboard players operation $motionX gm4_reeling_rods.math -= $currentX gm4_reeling_rods.math 
scoreboard players operation $motionY gm4_reeling_rods.math -= $currentY gm4_reeling_rods.math 
scoreboard players operation $motionZ gm4_reeling_rods.math -= $currentZ gm4_reeling_rods.math 

# store Motion, y to be edited after
execute store result storage gm4_reeling_rods:temp item_data.Motion[0] double 0.1 run scoreboard players get $motionX gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[1] double 0.1 run scoreboard players get $motionY gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[2] double 0.1 run scoreboard players get $motionZ gm4_reeling_rods.math

# Square the distances on each axis
scoreboard players operation $motionX gm4_reeling_rods.math *= $motionX gm4_reeling_rods.math 
scoreboard players operation $motionY gm4_reeling_rods.math *= $motionY gm4_reeling_rods.math 
scoreboard players operation $motionZ gm4_reeling_rods.math *= $motionZ gm4_reeling_rods.math 

# Add the squares
scoreboard players operation $lookup_key gm4_reeling_rods.math = $motionX gm4_reeling_rods.math
scoreboard players operation $lookup_key gm4_reeling_rods.math += $motionY gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp lookup_key int 1 \
  run scoreboard players operation $lookup_key gm4_reeling_rods.math += $motionZ gm4_reeling_rods.math

# Get Y motion, scaled up to match the squared values of before
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp item_data.Motion[1] 100

# Add looked up value to motionY above
function gm4_reeling_rods:get_lookup with storage gm4_reeling_rods:temp

# Store the Completed motionY
execute store result storage gm4_reeling_rods:temp item_data.Motion[1] double 0.01 run scoreboard players get $motionY gm4_reeling_rods.math
