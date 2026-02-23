# places the smeltery down
# @s = player who placed the smeltery
# located at the center of the placed block
# run from gm4_smelteries:machine/verify_place_down

# place block depending on rotation
execute if score $single_rotation gm4_machine_data matches 1 run data modify storage gm4_smelteries:placement temp set value {facing:"south",Rotation:[0.0f,0.0f]}
execute if score $single_rotation gm4_machine_data matches 2 run data modify storage gm4_smelteries:placement temp set value {facing:"west",Rotation:[90.0f,0.0f]}
execute if score $single_rotation gm4_machine_data matches 3 run data modify storage gm4_smelteries:placement temp set value {facing:"north",Rotation:[180.0f,0.0f]}
execute if score $single_rotation gm4_machine_data matches 4 run data modify storage gm4_smelteries:placement temp set value {facing:"east",Rotation:[-90.0f,0.0f]}

function gm4_smelteries:machine/place_rotated with storage gm4_smelteries:placement temp

data remove storage gm4_smelteries:placement temp

# link cauldron stand to smeltery marker
execute store result score $new gm4_smelt_id run data get entity @e[type=marker,distance=..0.1,tag=gm4_new_machine,limit=1] UUID[3]
scoreboard players operation @e[distance=..3,tag=gm4_new_machine] gm4_smelt_id = $new gm4_smelt_id

# mark block as placed
playsound block.anvil.use block @a[distance=..4] ~ ~ ~ 1 0.8
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..3] remove gm4_new_machine
