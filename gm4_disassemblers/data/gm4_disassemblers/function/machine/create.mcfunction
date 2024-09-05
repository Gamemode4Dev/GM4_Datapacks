# places the disassembler down
# @s = player who placed the disassembler
# located at the center of the placed block
# run from gm4_disassemblers:machine/verify_place_down

# place block depending on rotation
execute if score $rotation gm4_machine_data matches 1 run function gm4_disassemblers:machine/rotate/down
execute if score $rotation gm4_machine_data matches 2 run function gm4_disassemblers:machine/rotate/up
execute if score $rotation gm4_machine_data matches 3 run function gm4_disassemblers:machine/rotate/south
execute if score $rotation gm4_machine_data matches 4 run function gm4_disassemblers:machine/rotate/west
execute if score $rotation gm4_machine_data matches 5 run function gm4_disassemblers:machine/rotate/north
execute if score $rotation gm4_machine_data matches 6 run function gm4_disassemblers:machine/rotate/east

# mark block as placed
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.9 0.1
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
