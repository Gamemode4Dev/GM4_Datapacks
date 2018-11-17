#@s = alchemical crafters with valid recipe format inside
#run from alchemical_crafting

#charge 1 level
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:ghast_tear"}]} run function equivalent_exchange:recharge/charge_1

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:experience_bottle"}]} run function equivalent_exchange:recharge/charge_1

execute if score @s gm4_slot_count matches 3 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:lapis_block"},{Slot:3b,id:"minecraft:lapis_block"}]} run function equivalent_exchange:recharge/charge_1

execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:prismarine_crystals"},{Slot:2b,id:"minecraft:prismarine_crystals"},{Slot:3b,id:"minecraft:prismarine_crystals"},{Slot:4b,id:"minecraft:prismarine_crystals"},{Slot:5b,id:"minecraft:prismarine_crystals"},{Slot:6b,id:"minecraft:prismarine_crystals"},{Slot:7b,id:"minecraft:prismarine_crystals"},{Slot:8b,id:"minecraft:prismarine_crystals"}]} run function equivalent_exchange:recharge/charge_1

execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:blaze_rod"},{Slot:2b,id:"minecraft:blaze_rod"},{Slot:3b,id:"minecraft:blaze_rod"},{Slot:4b,id:"minecraft:blaze_rod"},{Slot:5b,id:"minecraft:blaze_rod"},{Slot:6b,id:"minecraft:blaze_rod"},{Slot:7b,id:"minecraft:blaze_rod"},{Slot:8b,id:"minecraft:blaze_rod"}]} run function equivalent_exchange:recharge/charge_1

execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:glowstone"},{Slot:2b,id:"minecraft:glowstone"},{Slot:3b,id:"minecraft:glowstone"},{Slot:4b,id:"minecraft:glowstone"},{Slot:5b,id:"minecraft:glowstone"},{Slot:6b,id:"minecraft:glowstone"},{Slot:7b,id:"minecraft:glowstone"},{Slot:8b,id:"minecraft:glowstone"}]} run function equivalent_exchange:recharge/charge_1

#charge 2 levels
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:end_crystal"}]} run function equivalent_exchange:recharge/charge_2

#charge 3 levels
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:heart_of_the_sea"}]} run function equivalent_exchange:recharge/charge_3

#charge 4 levels
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:nether_star"}]} run function equivalent_exchange:recharge/charge_4

execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 unless score @s gm4_charge_level matches 4 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}},{Slot:1b,id:"minecraft:enchanted_golden_apple"}]} run function equivalent_exchange:recharge/charge_4