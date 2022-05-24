# run from gm4_forming_press:recipes/forming_check_recipes

# netherrack to lava
execute store success score $crafted gm4_crafting if score $stack_size gm4_crafting matches 1 if data storage gm4_forming_press:temp/crafter {Items:[{Slot:0b,id:"minecraft:netherrack"},{Slot:1b,id:"minecraft:netherrack"},{Slot:2b,id:"minecraft:netherrack"},{Slot:3b,id:"minecraft:netherrack"},{Slot:4b,id:"minecraft:bucket"},{Slot:5b,id:"minecraft:netherrack"},{Slot:6b,id:"minecraft:netherrack"},{Slot:7b,id:"minecraft:netherrack"},{Slot:8b,id:"minecraft:netherrack"}]} run loot replace block ~ ~ ~ container.0 loot gm4_forming_press:crafting/lava_bucket
