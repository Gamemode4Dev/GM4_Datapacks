# place block based on the player's rotation
#  this mimics how droppers and pistons are placed
execute if score $rotation gm4_machine_data matches 1 run function gm4_machines_example:machine/rotate_machine_1/down
execute if score $rotation gm4_machine_data matches 2 run function gm4_machines_example:machine/rotate_machine_1/up
execute if score $rotation gm4_machine_data matches 3 run function gm4_machines_example:machine/rotate_machine_1/south
execute if score $rotation gm4_machine_data matches 4 run function gm4_machines_example:machine/rotate_machine_1/west
execute if score $rotation gm4_machine_data matches 5 run function gm4_machines_example:machine/rotate_machine_1/north
execute if score $rotation gm4_machine_data matches 6 run function gm4_machines_example:machine/rotate_machine_1/east

# mark block as placed
scoreboard players set $placed_block gm4_machine_data 1
