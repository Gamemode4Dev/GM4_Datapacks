# verifies that the placed down machine was from this module
# @s = player who placed down the machine
# located at the machine block marker (at the center of the placed down block)
# run from #gm4_machines:place_down

execute if score $placed_block gm4_machine_data matches 0 if score gm4_relocators load.status matches 1.. store success score $placed_block gm4_machine_data if data storage gm4_machines:temp {id:"gm4_relocator_empty"} run function gm4_relocators:pick_up/find_block
execute if score $placed_block gm4_machine_data matches 0 if score gm4_relocators load.status matches 1.. store success score $placed_block gm4_machine_data if data storage gm4_machines:temp {id:"gm4_relocator_full"} run function gm4_relocators:place_down/place_block
