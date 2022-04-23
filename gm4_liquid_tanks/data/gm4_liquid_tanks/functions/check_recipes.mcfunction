# @s = custom crafter running recipes
# run from #gm4_custom_crafters:check_recipes

execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 7 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:glass"},{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:comparator"},{Slot:5b,id:"minecraft:iron_ingot"},{Slot:7b,id:"minecraft:hopper"}]} run loot replace block ~ ~ ~ container.0 loot gm4_liquid_tanks:crafting/liquid_tank
