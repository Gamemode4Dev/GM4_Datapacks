# detects when the player places a machine block
# @s = player who placed down a machine block
# located at @s
# run from advancement gm4_machines:place_machine_block

execute if score gm4_machines load.status matches 1 if score gm4_machines_minor load.status matches 0 run function gm4_machines-1.0:place_down/place_machine_block
