# @s = custom crafter running recipes
# at custom crafter
# run from #gm4_custom_crafters:check_recipes

execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 5 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:string"},{Slot:1b,id:"minecraft:string"},{Slot:2b,id:"minecraft:string"},{Slot:4b,id:"minecraft:iron_ingot"},{Slot:7b,id:"minecraft:stick"}]} run loot replace block ~ ~ ~ container.0 loot gm4_furniture:crafting/paintbrush
execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 8 \
  if items block ~ ~ ~ container.0 #minecraft:planks if items block ~ ~ ~ container.2 #minecraft:planks if items block ~ ~ ~ container.3 #minecraft:planks if items block ~ ~ ~ container.5 #minecraft:planks if items block ~ ~ ~ container.6 #minecraft:planks if items block ~ ~ ~ container.8 #minecraft:planks \
  if items block ~ ~ ~ container.1 minecraft:crafting_table if items block ~ ~ ~ container.4 minecraft:iron_ingot \
  run loot replace block ~ ~ ~ container.0 loot gm4_furniture:crafting/furniture_station
