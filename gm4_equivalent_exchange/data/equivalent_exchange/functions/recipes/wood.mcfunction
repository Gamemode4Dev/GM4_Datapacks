#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


#log -> stripped log
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oak_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:birch_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_birch_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:spruce_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_spruce_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:jungle_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_jungle_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:acacia_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_acacia_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dark_oak_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_dark_oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

#stripped log -> log
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_oak_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_birch_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:birch_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_spruce_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:spruce_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_jungle_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:jungle_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_acacia_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:acacia_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_dark_oak_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dark_oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

#wood -> stripped wood
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oak_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_oak_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:birch_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_birch_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:spruce_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_spruce_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:jungle_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_jungle_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:acacia_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_acacia_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dark_oak_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stripped_dark_oak_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

#stripped wood -> wood
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_oak_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oak_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_birch_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:birch_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_spruce_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:spruce_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_jungle_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:jungle_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_acacia_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:acacia_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:stripped_dark_oak_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dark_oak_wood",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

#planks -> log
execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oak_planks"},{Slot:2b,id:"minecraft:oak_planks"},{Slot:4b,id:"minecraft:oak_planks"},{Slot:5b,id:"minecraft:oak_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:birch_planks"},{Slot:2b,id:"minecraft:birch_planks"},{Slot:4b,id:"minecraft:birch_planks"},{Slot:5b,id:"minecraft:birch_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:birch_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:spruce_planks"},{Slot:2b,id:"minecraft:spruce_planks"},{Slot:4b,id:"minecraft:spruce_planks"},{Slot:5b,id:"minecraft:spruce_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:spruce_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:jungle_planks"},{Slot:2b,id:"minecraft:jungle_planks"},{Slot:4b,id:"minecraft:jungle_planks"},{Slot:5b,id:"minecraft:jungle_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:jungle_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:acacia_planks"},{Slot:2b,id:"minecraft:acacia_planks"},{Slot:4b,id:"minecraft:acacia_planks"},{Slot:5b,id:"minecraft:acacia_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:acacia_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}

execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dark_oak_planks"},{Slot:2b,id:"minecraft:dark_oak_planks"},{Slot:4b,id:"minecraft:dark_oak_planks"},{Slot:5b,id:"minecraft:dark_oak_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dark_oak_log",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:0}}}]}