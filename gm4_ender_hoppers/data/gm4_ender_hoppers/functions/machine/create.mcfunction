# places the ender_hopper down
# @s = player who placed the ender_hopper
# located at the center of the placed block
# run from gm4_ender_hoppers:machine/verify_place_down

# place block depending on face_placement
execute if score $face_placement gm4_machine_data matches 1..2 run function gm4_ender_hoppers:machine/rotate/down
execute if score $face_placement gm4_machine_data matches 3 run function gm4_ender_hoppers:machine/rotate/south
execute if score $face_placement gm4_machine_data matches 4 run function gm4_ender_hoppers:machine/rotate/west
execute if score $face_placement gm4_machine_data matches 5 run function gm4_ender_hoppers:machine/rotate/north
execute if score $face_placement gm4_machine_data matches 6 run function gm4_ender_hoppers:machine/rotate/east

# mark block as placed
particle large_smoke ~ ~ ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.respawn_anchor.charge block @a[distance=..5] ~ ~ ~ 0.3 0.7
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
