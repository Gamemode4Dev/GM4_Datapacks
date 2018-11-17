#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..7 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:nether_wart_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:nether_wart",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:9}}}]}

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..8 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:quartz_block"},{Slot:3b,id:"minecraft:quartz_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:quartz",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:8}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:magma_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magma_cream",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:4}}}]}