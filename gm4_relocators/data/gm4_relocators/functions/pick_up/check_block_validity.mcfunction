# checks if the block can be picked up
# @s = player who placed the relocator
# located at the center of the block to be picked up
# run from gm4_relocators:pick_up/find_block

# check if it's a container without any shulker boxes or filled relocators
scoreboard players set $valid_block gm4_rl_data 0
execute store success score $valid_block gm4_rl_data if block ~ ~ ~ #gm4_relocators:relocatable_block unless data block ~ ~ ~ Items[{id:"minecraft:shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:white_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:orange_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:magenta_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:light_blue_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:yellow_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:lime_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:pink_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:gray_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:light_gray_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:cyan_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:purple_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:blue_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:brown_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:green_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:red_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:black_shulker_box"}] unless data block ~ ~ ~ Items[{id:"minecraft:player_head",tag:{gm4_relocation:{}}}]

# check if it's a custom block
execute if score $valid_block gm4_rl_data matches 1 align xyz run tag @e[dx=0,tag=smithed.block] add gm4_relocating_block
execute if score $valid_block gm4_rl_data matches 1 run tag @e[distance=..0.5,tag=smithed.block] add gm4_relocating_block

scoreboard players set $found_marker gm4_rl_data 0
execute as @e[tag=gm4_relocating_block,distance=..1] run function #gm4_relocators:pick_up_check

# check if the custom block is allowed to be relocated
execute if score $found_marker gm4_rl_data matches 0 if entity @e[tag=gm4_relocating_block,distance=..1,limit=1] run scoreboard players set $valid_block gm4_rl_data 0

# proceed if the block is allowed to be picked up
execute if score $valid_block gm4_rl_data matches 1 run function gm4_relocators:pick_up/get_data
# else return the empty relocator
execute if score $valid_block gm4_rl_data matches 0 run function gm4_relocators:pick_up/failed

# clean up
tag @e[distance=..1] remove gm4_relocating_block
