# checks if the block is from this module
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from #gm4_relocators:pick_up_check

execute if score gm4_custom_crafters load.status matches 3.. if entity @s[tag=gm4_custom_crafter] run function gm4_relocators:custom_crafter_relocating/set_pick_up_data
