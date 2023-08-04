# verifies that the placed down machine was from this module
# @s = player who placed down the machine
# located at the machine block marker (at the center of the placed down block)
# run from #gm4_machines:place_down

execute if score $placed_block gm4_machine_data matches 0 store success score $placed_block gm4_machine_data if score gm4_custom_crafters load.status matches 3 if score gm4_custom_crafters_minor load.status matches 0 if data storage gm4_machines:temp {id:"gm4_custom_crafter"} run function gm4_custom_crafters:machine/create
# note that the load checks above are NOT required for a normal module; it's only included here because this is in a library
