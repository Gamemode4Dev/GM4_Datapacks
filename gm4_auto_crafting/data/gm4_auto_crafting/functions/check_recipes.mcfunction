# @s = custom crafters with valid recipe format inside
# run from #gm4_custom_crafters:check_recipes

# auto crafter recipe
execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 5 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:1b,id:"minecraft:copper_ingot"},{Slot:3b,id:"minecraft:redstone"},{Slot:4b,id:"minecraft:player_head",tag:{gm4_machines:{id:"custom_crafter"}}},{Slot:5b,id:"minecraft:redstone"},{Slot:7b,id:"minecraft:comparator"}]} run loot replace block ~ ~ ~ container.0 loot gm4_auto_crafting:crafting/auto_crafter

# recipes
execute if score $crafted gm4_crafting matches 0 run function gm4_auto_crafting:check_recipes/search
