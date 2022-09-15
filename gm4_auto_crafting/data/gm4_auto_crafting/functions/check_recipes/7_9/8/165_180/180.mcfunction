scoreboard players reset * gm4_craft_shapeless
execute if score $crafted gm4_crafting matches 0 if score $stack_size gm4_crafting matches ..64 store result score $minecraft:netherite_scrap gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[{id:"minecraft:netherite_scrap"}]
execute if score $minecraft:netherite_scrap gm4_craft_shapeless matches 4 store result score $minecraft:gold_ingot gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[{id:"minecraft:gold_ingot"}]
execute if score $minecraft:gold_ingot gm4_craft_shapeless matches 4 store result score $crafted gm4_crafting run loot replace block ~ ~ ~ container.0 loot gm4_auto_crafting:crafting/vanilla/netherite_ingot
