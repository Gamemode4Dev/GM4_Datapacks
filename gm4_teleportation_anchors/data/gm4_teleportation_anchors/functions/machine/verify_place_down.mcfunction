# verifies that the placed down machine was from this module
# @s = player who placed down the machine
# located at the machine block marker (at the center of the placed down block)
# run from #gm4_machines:place_down

execute if score $placed_block gm4_machine_data matches 0 if data storage gm4_machines:temp {id:"gm4_teleportation_jammer"} run function gm4_teleportation_anchors:machine/create_jammer
execute if score $placed_block gm4_machine_data matches 0 if data storage gm4_machines:temp {id:"gm4_teleportation_anchor"} run function gm4_teleportation_anchors:machine/create_anchor
