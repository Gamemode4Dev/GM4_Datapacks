# command block left behind due to lag
# command block placed from place_down/repair_head

# store the facing direction of the command block
execute if block ~ ~ ~ command_block[facing=down] run scoreboard players set facing gm4_rl_data 0
execute if block ~ ~ ~ command_block[facing=north] run scoreboard players set facing gm4_rl_data 1
execute if block ~ ~ ~ command_block[facing=east] run scoreboard players set facing gm4_rl_data 2
execute if block ~ ~ ~ command_block[facing=south] run scoreboard players set facing gm4_rl_data 3
execute if block ~ ~ ~ command_block[facing=west] run scoreboard players set facing gm4_rl_data 4

# force adjacent command blocks to activate
setblock ~ ~ ~ redstone_block
execute if block ~1 ~ ~1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~1 ~ ~1 {auto:1b}
execute if block ~1 ~ ~-1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~1 ~ ~-1 {auto:1b}
execute if block ~-1 ~ ~1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~-1 ~ ~1 {auto:1b}
execute if block ~-1 ~ ~-1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~-1 ~ ~-1 {auto:1b}

execute if block ~1 ~1 ~ command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~1 ~1 ~ {auto:1b}
execute if block ~-1 ~1 ~ command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~-1 ~1 ~ {auto:1b}
execute if block ~ ~1 ~1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~ ~1 ~1 {auto:1b}
execute if block ~ ~1 ~-1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~ ~1 ~-1 {auto:1b}

execute if block ~1 ~-1 ~ command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~1 ~-1 ~ {auto:1b}
execute if block ~-1 ~-1 ~ command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~-1 ~-1 ~ {auto:1b}
execute if block ~ ~-1 ~1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~ ~-1 ~1 {auto:1b}
execute if block ~ ~-1 ~-1 command_block{CustomName:'{"text":"Misplaced Relocated Block"}'} run data merge block ~ ~-1 ~-1 {auto:1b}

# place repair command block
execute if score facing gm4_rl_data matches 0 run setblock ~ ~ ~ command_block[facing=down]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/repair",CustomName:'{"text":"Misplaced Relocated Block"}'}
execute if score facing gm4_rl_data matches 1 run setblock ~ ~ ~ command_block[facing=north]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/repair",CustomName:'{"text":"Misplaced Relocated Block"}'}
execute if score facing gm4_rl_data matches 2 run setblock ~ ~ ~ command_block[facing=south]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/repair",CustomName:'{"text":"Misplaced Relocated Block"}'}
execute if score facing gm4_rl_data matches 3 run setblock ~ ~ ~ command_block[facing=east]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/repair",CustomName:'{"text":"Misplaced Relocated Block"}'}
execute if score facing gm4_rl_data matches 4 run setblock ~ ~ ~ command_block[facing=west]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/repair",CustomName:'{"text":"Misplaced Relocated Block"}'}
scoreboard players reset facing gm4_rl_data
