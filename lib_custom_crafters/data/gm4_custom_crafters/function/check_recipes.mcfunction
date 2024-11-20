# attempts to complete the custom crafter recipe
# @s = crafters containing a potential recipe
# located at @s
# run from #gm4_custom_crafters:check_recipes

execute if score gm4_custom_crafters load.status matches 3 if score gm4_custom_crafters_minor load.status matches 0 if score $crafted gm4_crafting matches 0 store success score $crafted gm4_crafting if score $slot_count gm4_crafting matches 9 if score $stack_size gm4_crafting matches ..64 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:iron_ingot"},{Slot:1b,id:"minecraft:light_blue_dye"},{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:cobblestone"},{Slot:4b,id:"minecraft:crafting_table"},{Slot:5b,id:"minecraft:cobblestone"},{Slot:6b,id:"minecraft:cobblestone"},{Slot:7b,id:"minecraft:dropper"},{Slot:8b,id:"minecraft:cobblestone"}]} run loot replace block ~ ~ ~ container.0 loot gm4_custom_crafters:crafting/custom_crafter
