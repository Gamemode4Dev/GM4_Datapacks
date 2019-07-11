#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


#saplings
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oak_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dark_oak_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dark_oak_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:spruce_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:spruce_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:jungle_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:jungle_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:acacia_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:acacia_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:birch_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:birch_sapling"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oak_sapling",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

#leaves
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oak_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dark_oak_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dark_oak_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:spruce_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:spruce_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:jungle_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:jungle_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:acacia_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:acacia_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:birch_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:birch_leaves"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oak_leaves",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

#flowers
execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:poppy"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:red_tulip",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:red_tulip"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:orange_tulip",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:orange_tulip"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:white_tulip",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:white_tulip"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:lily_of_the_valley",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:lily_of_the_valley"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:azure_bluet",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:azure_bluet"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:oxeye_daisy",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:oxeye_daisy"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:allium",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:allium"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:blue_orchid",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:blue_orchid"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cornflower",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute if score @s gm4_ee_charge matches 2.. if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:cornflower"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dandelion",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

execute iif score @s gm4_ee_charge matches 2.. f score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:dandelion"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:poppy",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:2,fail_increase:7}}}]}

#mushrooms
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:red_mushroom"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:brown_mushroom",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:brown_mushroom"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:red_mushroom",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:1,fail_increase:7}}}]}
