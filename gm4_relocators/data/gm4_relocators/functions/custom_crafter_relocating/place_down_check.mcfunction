# checks if the block is from this module
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_down_check

execute if score $placed_block gm4_rl_data matches 0 if score gm4_custom_crafters load.status matches 3 if data storage gm4_relocators:temp gm4_relocation{custom_block:"gm4_custom_crafter"} run function gm4_relocators:custom_crafter_relocating/summon_block_markers
