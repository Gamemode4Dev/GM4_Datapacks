scoreboard players reset * gm4_craft_shapeless
execute if score $crafted gm4_crafting matches 0 if score $stack_size gm4_crafting matches ..4 store result score $minecraft:glass_bottle gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[{id:"minecraft:glass_bottle"}]
execute if score $minecraft:glass_bottle gm4_craft_shapeless matches 4 store result score $crafted gm4_crafting if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:honey_block"}]} run loot replace block ~ ~ ~ container.0 loot gm4_auto_crafting:crafting/vanilla/honey_bottle
