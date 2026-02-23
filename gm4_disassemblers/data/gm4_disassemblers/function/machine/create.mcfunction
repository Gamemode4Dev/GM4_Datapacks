# places the disassembler down
# @s = player who placed the disassembler
# located at the center of the placed block
# run from gm4_disassemblers:machine/verify_place_down

# place block depending on rotation
execute if score $rotation gm4_machine_data matches 1 run data modify storage gm4_disassemblers:temp placement set value {facing:"down",Rotation:[180.0f,0.0f],model:"gm4_disassemblers:block/disassembler_down"}
execute if score $rotation gm4_machine_data matches 2 run data modify storage gm4_disassemblers:temp placement set value {facing:"up",Rotation:[0.0f,0.0f],model:"gm4_disassemblers:block/disassembler"}
execute if score $rotation gm4_machine_data matches 3 run data modify storage gm4_disassemblers:temp placement set value {facing:"south",Rotation:[0.0f,0.0f],model:"gm4_disassemblers:block/disassembler_side"}
execute if score $rotation gm4_machine_data matches 4 run data modify storage gm4_disassemblers:temp placement set value {facing:"west",Rotation:[90.0f,0.0f],model:"gm4_disassemblers:block/disassembler_side"}
execute if score $rotation gm4_machine_data matches 5 run data modify storage gm4_disassemblers:temp placement set value {facing:"north",Rotation:[180.0f,0.0f],model:"gm4_disassemblers:block/disassembler_side"}
execute if score $rotation gm4_machine_data matches 6 run data modify storage gm4_disassemblers:temp placement set value {facing:"east",Rotation:[-90.0f,0.0f],model:"gm4_disassemblers:block/disassembler_side"}

function gm4_disassemblers:machine/place_rotated with storage gm4_disassemblers:temp placement

data remove storage gm4_disassemblers:temp placement

# mark block as placed
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
tag @e[distance=..2] remove gm4_new_machine
