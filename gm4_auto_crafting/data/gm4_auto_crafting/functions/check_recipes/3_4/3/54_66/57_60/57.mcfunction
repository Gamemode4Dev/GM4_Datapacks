scoreboard players reset * gm4_craft_shapeless
execute if score $crafted gm4_crafting matches 0 if score $stack_size gm4_crafting matches ..21 store result score $minecraft:white_dye gm4_craft_shapeless if data storage gm4_custom_crafters:temp/crafter Items[{id:"minecraft:white_dye"}]
execute if score $minecraft:white_dye gm4_craft_shapeless matches 2 store result score $crafted gm4_crafting if data storage gm4_custom_crafters:temp/crafter {Items:[{id:"minecraft:black_dye"}]} run loot replace block ~ ~ ~ container.0 loot gm4_auto_crafting:crafting/vanilla/light_gray_dye_from_black_white_dye
