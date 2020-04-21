# @s = gm4_pulverizer if block ~ ~ ~ hopper[enabled=true]{Items:[{Slot:0b}]}
# run from #gm4_pulverizers:pulverize_check

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bone_block"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:bone"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:coal_block"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:gold_ingot"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:iron_ingot"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:redstone_block"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:stone"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 4.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:cobblestone"}]} run scoreboard players set input_count gm4_pul_data 4

execute if score stack_size gm4_pul_data matches 2.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:gravel"}]} run scoreboard players set input_count gm4_pul_data 2

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:blaze_rod"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:prismarine"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:sea_lantern"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:blue_ice"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:packed_ice"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:clay"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:glowstone"}]} run scoreboard players set input_count gm4_pul_data 1

execute if score stack_size gm4_pul_data matches 1.. if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:coarse_dirt"}]} run scoreboard players set input_count gm4_pul_data 1
