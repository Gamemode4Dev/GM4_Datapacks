# check for recipes in custom crafter

# minecart and furnace
execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 4 if score $stack_size gm4_crafting matches ..1 if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:furnace"},{id:"minecraft:tripwire_hook"},{id:"minecraft:minecart"},{id:"minecraft:piston"}]} run loot replace block ~ ~ ~ container.0 loot gm4_tunnel_bores:crafting/piston_minecart

# furnace minecart
execute if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 3 if score $stack_size gm4_crafting matches ..1 if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:tripwire_hook"},{id:"minecraft:furnace_minecart"},{id:"minecraft:piston"}]} run loot replace block ~ ~ ~ container.0 loot gm4_tunnel_bores:crafting/piston_minecart
