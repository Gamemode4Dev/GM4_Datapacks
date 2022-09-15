# @s = custom crafter running recipes
# run from #gm4_custom_crafters:check_recipes

execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 3 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:ender_eye"},{Slot:3b,id:"minecraft:respawn_anchor"},{Slot:6b,id:"minecraft:hopper"}]} run loot replace block ~ ~ ~ container.0 loot gm4_ender_hoppers:crafting/ender_hopper

execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 2 if score $stack_size gm4_crafting matches 1 if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:player_head",tag:{gm4_machines:{id:"ender_hopper"}}},{id:"minecraft:minecart"}]} run loot replace block ~ ~ ~ container.0 loot gm4_ender_hoppers:crafting/ender_hopper_minecart
