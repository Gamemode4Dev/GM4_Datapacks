#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


execute if score @s gm4_slot_count matches 5 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:emerald"},{Slot:2b,id:"minecraft:emerald"},{Slot:4b,id:"minecraft:emerald"},{Slot:5b,id:"minecraft:emerald"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:diamond",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..8 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:quartz_block",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:8}}}]}

execute if score @s gm4_slot_count matches 4 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:quartz"},{Slot:3b,id:"minecraft:quartz"},{Slot:4b,id:"minecraft:quartz"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:gold_ingot",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1}}}]}

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..5 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:gold_ingot"},{Slot:3b,id:"minecraft:gold_ingot"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:iron_ingot",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:12}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..21 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:lapis_lazuli"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:iron_ingot",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:3}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:iron_ingot"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:coal",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:2}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_charged:1b}},{Slot:1b,id:"minecraft:coal"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:redstone",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:2}}}]}