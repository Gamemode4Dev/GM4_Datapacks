# checks if the block is from this module
# @s = player who placed the block
# located at the center of the block to be placed
# run from #gm4_relocators:place_down_check

execute if block ~ ~ ~ air if score gm4_soul_glass load.status matches 1.. if data storage gm4_relocators:temp gm4_relocation.block_state{id:"blast_furnace"} run function gm4_soul_glass:relocate/summon_furnace_marker
