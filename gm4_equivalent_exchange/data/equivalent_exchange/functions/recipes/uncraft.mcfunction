#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


#nether wart block
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..7 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:nether_wart_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:nether_wart",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:9,drain_value:1,fail_increase:5}}}]}

#quartz block
execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..8 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:quartz_block"},{Slot:3b,id:"minecraft:quartz_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:quartz",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:8,drain_value:1,fail_increase:5}}}]}

#magma block
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:magma_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magma_cream",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:4,drain_value:1,fail_increase:5}}}]}

#purpur
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:purpur_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:popped_chorus_fruit",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

#ice
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..7 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:blue_ice"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:packed_ice",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:9,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..7 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:packed_ice"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:ice",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:9,drain_value:1,fail_increase:5}}}]}

#concrete
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:white_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:white_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:orange_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:orange_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:magenta_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magenta_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:light_blue_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:light_blue_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:yellow_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:yellow_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:lime_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:lime_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:pink_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:pink_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:gray_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:gray_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:light_gray_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:light_gray_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:cyan_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cyan_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:purple_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:purple_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:blue_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:blue_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:brown_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:brown_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:green_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:green_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:red_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:red_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:black_concrete"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:black_concrete_powder",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

#glazed terracotta
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:white_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:white_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:orange_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:orange_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:magenta_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magenta_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:light_blue_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:light_blue_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:yellow_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:yellow_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:lime_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:lime_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:pink_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:pink_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:gray_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:gray_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:light_gray_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:light_gray_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:cyan_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cyan_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:purple_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:purple_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:blue_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:blue_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:brown_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:brown_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:green_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:green_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:red_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:red_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:black_glazed_terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:black_terracotta",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:5}}}]}
