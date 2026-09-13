# Gets motion vector to launch entity to player. X and Z motion is 10% the block distance between the player and current position. Y motion uses the sum of the squares of position deltas as a lookup table key, the value of which is added to the Y position delta to get the Y motion.
# @s = entity with items to be yoinked
# at bobber in @s (most of the time)
# run from pull_items

data modify storage gm4_reeling_rods:temp item_data.Motion set value [0d,0d,0d]

# Store current position
execute summon marker run function gm4_reeling_rods:get_execution_pos

data modify storage gm4_reeling_rods:temp item_data.Motion[0] set compute default float gm4_reeling_rods:motion_to_player/x
data modify storage gm4_reeling_rods:temp item_data.Motion[1] set compute default float gm4_reeling_rods:motion_to_player/y
data modify storage gm4_reeling_rods:temp item_data.Motion[2] set compute default float gm4_reeling_rods:motion_to_player/z
