#@s = custom crafters with valid recipe format inside, 6 slots max 1 item

#recipes
#horse armour
execute if block ~ ~ ~ dropper{Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:iron_ingot"},{Slot:6b,id:"minecraft:iron_ingot"},{Slot:8b,id:"minecraft:iron_ingot"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"iron_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:2b,id:"minecraft:gold_ingot"},{Slot:3b,id:"minecraft:gold_ingot"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:gold_ingot"},{Slot:6b,id:"minecraft:gold_ingot"},{Slot:8b,id:"minecraft:gold_ingot"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"golden_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:diamond"},{Slot:6b,id:"minecraft:diamond"},{Slot:8b,id:"minecraft:diamond"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"diamond_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
