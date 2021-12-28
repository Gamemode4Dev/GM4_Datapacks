# places the smeltery down
# @s = player who placed the smeltery
# located at the center of the placed block
# run from gm4_smelteries:machine/verify_place_down

# place block depending on rotation
execute if score $single_rotation gm4_machine_data matches 1 run function gm4_smelteries:machine/rotate/south
execute if score $single_rotation gm4_machine_data matches 2 run function gm4_smelteries:machine/rotate/west
execute if score $single_rotation gm4_machine_data matches 3 run function gm4_smelteries:machine/rotate/north
execute if score $single_rotation gm4_machine_data matches 4 run function gm4_smelteries:machine/rotate/east

# mark block as placed
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8
scoreboard players set $placed_block gm4_machine_data 1
