# checks if the block is from this module
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_down_check

execute if score $placed_block gm4_rl_data matches 0 if score gm4_teleportation_anchors load.status matches 1.. store success score $placed_block gm4_rl_data if data storage gm4_relocators:temp gm4_relocation{custom_block:"gm4_teleportation_jammer"} run function gm4_teleportation_anchors:relocate/summon_block_markers_jammer
