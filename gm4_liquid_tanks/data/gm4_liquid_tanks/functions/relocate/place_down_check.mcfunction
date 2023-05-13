# checks if the block is from this module
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_down_check

execute if score $placed_block gm4_rl_data matches 0 if score gm4_liquid_tanks load.status matches 2.. store success score $placed_block gm4_rl_data if data storage gm4_relocators:temp gm4_relocation{custom_block:"gm4_liquid_tank"} run function gm4_liquid_tanks:relocate/summon_block_markers
