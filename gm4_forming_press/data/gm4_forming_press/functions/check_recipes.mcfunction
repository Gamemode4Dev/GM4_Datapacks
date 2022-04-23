# @s = custom crafter running recipes
# run from #gm4_custom_crafters:check_recipes

execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 7 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:1b,id:"minecraft:piston"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:comparator"},{Slot:5b,id:"minecraft:cobblestone"},{Slot:6b,id:"minecraft:cobblestone"},{Slot:7b,id:"minecraft:furnace"},{Slot:8b,id:"minecraft:cobblestone"}]} run loot replace block ~ ~ ~ container.0 loot gm4_forming_press:crafting/forming_press
