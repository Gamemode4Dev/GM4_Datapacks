# checks if the block is from this module
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from #gm4_relocators:pick_up_check

execute if score gm4_liquid_tanks load.status matches 2.. if entity @s[tag=gm4_liquid_tank] run function gm4_liquid_tanks:relocate/set_pick_up_data
