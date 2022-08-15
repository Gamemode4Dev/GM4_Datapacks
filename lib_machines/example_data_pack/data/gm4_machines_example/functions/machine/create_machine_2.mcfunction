# place block based on which face it was placed on
#  this mimics how hoppers are placed
execute if score $face_placement gm4_machine_data matches 1..2 run function gm4_machines_example:machine/rotate_machine_2/down
execute if score $face_placement gm4_machine_data matches 3 run function gm4_machines_example:machine/rotate_machine_2/south
execute if score $face_placement gm4_machine_data matches 4 run function gm4_machines_example:machine/rotate_machine_2/west
execute if score $face_placement gm4_machine_data matches 5 run function gm4_machines_example:machine/rotate_machine_2/north
execute if score $face_placement gm4_machine_data matches 6 run function gm4_machines_example:machine/rotate_machine_2/east

# mark block as placed
scoreboard players set $placed_block gm4_machine_data 1
