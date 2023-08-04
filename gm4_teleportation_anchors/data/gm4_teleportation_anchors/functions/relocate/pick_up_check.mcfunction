# checks if the block is from this module
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from #gm4_relocators:pick_up_check

execute if score gm4_teleportation_anchors load.status matches 1.. if entity @s[tag=gm4_teleportation_jammer] run function gm4_teleportation_anchors:relocate/set_pick_up_data_jammer
