#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting


#fish
execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:tropical_fish"},{Slot:3b,id:"minecraft:tropical_fish"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cod",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:cod"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:salmon",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:salmon"},{Slot:3b,id:"minecraft:salmon"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:pufferfish",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

#reverse fish
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:pufferfish"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:salmon",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:2}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:salmon"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cod",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:cod"},{Slot:3b,id:"minecraft:cod"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:tropical_fish",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:4}}}]}

#raw meat
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:chicken"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:porkchop",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:porkchop"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:mutton",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:mutton"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:beef",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:beef"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:rabbit",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:rabbit"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:chicken",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1,drain_value:3,fail_increase:10}}}]}