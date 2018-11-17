#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


#cobble <-> mossy cobble
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:cobblestone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:mossy_cobblestone",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:mossy_cobblestone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cobblestone",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

#stone variants
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:stone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:diorite",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:diorite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:andesite",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:andesite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:granite",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:granite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stone",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

#stone bricks
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:stone_bricks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:mossy_stone_bricks",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:mossy_stone_bricks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cracked_stone_bricks",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:cracked_stone_bricks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:chiseled_stone_bricks",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:chiseled_stone_bricks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stone_bricks",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

#quartz blocks
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:quartz_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:quartz_pillar",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:quartz_pillar"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:chiseled_quartz_block",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:chiseled_quartz_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:quartz_block",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}