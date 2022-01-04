# places the block_compressor down
# @s = player who placed the block_compressor
# located at the center of the placed block
# run from gm4_block_compressors:machine/verify_place_down

# place block depending on rotation
execute if score $rotation gm4_machine_data matches 1 run function gm4_block_compressors:machine/rotate/down
execute if score $rotation gm4_machine_data matches 2 run function gm4_block_compressors:machine/rotate/up
execute if score $rotation gm4_machine_data matches 3 run function gm4_block_compressors:machine/rotate/south
execute if score $rotation gm4_machine_data matches 4 run function gm4_block_compressors:machine/rotate/west
execute if score $rotation gm4_machine_data matches 5 run function gm4_block_compressors:machine/rotate/north
execute if score $rotation gm4_machine_data matches 6 run function gm4_block_compressors:machine/rotate/east

# mark block as placed
playsound minecraft:block.piston.contract block @a[distance=..5]
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
