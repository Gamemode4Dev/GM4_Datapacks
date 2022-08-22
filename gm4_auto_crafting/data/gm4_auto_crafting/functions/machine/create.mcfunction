# places the auto_crafter down
# @s = player who placed the auto_crafter
# located at the center of the placed block
# run from gm4_auto_crafting:machine/verify_place_down

# place block depending on rotation
execute if score $single_rotation gm4_machine_data matches 1 run function gm4_auto_crafting:machine/rotate/south
execute if score $single_rotation gm4_machine_data matches 2 run function gm4_auto_crafting:machine/rotate/west
execute if score $single_rotation gm4_machine_data matches 3 run function gm4_auto_crafting:machine/rotate/north
execute if score $single_rotation gm4_machine_data matches 4 run function gm4_auto_crafting:machine/rotate/east

# mark block as placed
playsound minecraft:block.amethyst_block.place block @a[distance=..16] ~ ~ ~ 1 1.6
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..3] remove gm4_new_machine
