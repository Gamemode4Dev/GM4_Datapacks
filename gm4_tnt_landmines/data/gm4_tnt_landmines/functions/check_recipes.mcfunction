# tnt landmine
execute if score $crafted gm4_crafting matches 0 if score $slot_count gm4_crafting matches 7 if score $stack_size gm4_crafting matches ..64 run function gm4_tnt_landmines:checks/recipe

# soft defuser
execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 6 if score $stack_size gm4_crafting matches 1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_harming"}},{Slot:1b,id:"minecraft:stone_pressure_plate"},{Slot:2b,id:"minecraft:potion",tag:{Potion:"minecraft:strong_harming"}},{Slot:3b,id:"minecraft:obsidian"},{Slot:4b,id:"minecraft:player_head",tag:{gm4_tnt_landmines:{item:"landmine",block:"minecraft:tnt"}}},{Slot:5b,id:"minecraft:obsidian"}]} run loot replace block ~ ~ ~ container.0 loot gm4_tnt_landmines:crafting/soft_defuser
