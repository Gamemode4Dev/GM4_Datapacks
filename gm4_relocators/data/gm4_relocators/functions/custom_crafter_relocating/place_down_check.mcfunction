# checks if the block is from this module
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_block/entity_check

execute if score $placed_block gm4_rl_data matches 0 store success score $placed_block gm4_rl_data if data storage gm4_relocators:temp gm4_relocation{custom_block:"gm4_custom_crafter"} run function gm4_relocators:custom_crafter_relocating/summon_block_markers
