# places the custom crafter down
# @s = player who placed the custom crafter
# located at the center of the placed block
# run from gm4_custom_crafters:machine/verify_place_down

# place block depending on rotation
execute if score $rotation gm4_machine_data matches 1 run function gm4_custom_crafters:machine/rotate/down
execute if score $rotation gm4_machine_data matches 2 run function gm4_custom_crafters:machine/rotate/up
execute if score $rotation gm4_machine_data matches 3 run function gm4_custom_crafters:machine/rotate/south
execute if score $rotation gm4_machine_data matches 4 run function gm4_custom_crafters:machine/rotate/west
execute if score $rotation gm4_machine_data matches 5 run function gm4_custom_crafters:machine/rotate/north
execute if score $rotation gm4_machine_data matches 6 run function gm4_custom_crafters:machine/rotate/east

# mark block as placed
playsound minecraft:block.barrel.close block @a[distance=..6] ~ ~ ~ 1 1.6
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
