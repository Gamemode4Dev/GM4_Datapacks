# @s = custom crafter running recipes
# run from #gm4_custom_crafters:recipe_check

execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches 1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:cobblestone"},{Slot:1b,id:"minecraft:cobblestone"},{Slot:2b,id:"minecraft:cobblestone"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:furnace"},{Slot:5b,id:"minecraft:cobblestone"},{Slot:6b,id:"minecraft:iron_ingot"},{Slot:7b,id:"minecraft:comparator"},{Slot:8b,id:"minecraft:iron_ingot"}]} run loot replace block ~ ~ ~ container.0 loot gm4_smelteries:crafting/smeltery
