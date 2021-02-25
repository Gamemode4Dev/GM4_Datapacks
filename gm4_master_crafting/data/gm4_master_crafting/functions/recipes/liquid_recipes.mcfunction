# run from gm4_master_crafting:recipes/master_recipe_check

# netherrack to lava
execute store success score successful_master_craft gm4_slot_count if score @s gm4_stack_size matches 1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:netherrack"},{Slot:1b,id:"minecraft:netherrack"},{Slot:2b,id:"minecraft:netherrack"},{Slot:3b,id:"minecraft:netherrack"},{Slot:4b,id:"minecraft:bucket"},{Slot:5b,id:"minecraft:netherrack"},{Slot:6b,id:"minecraft:netherrack"},{Slot:7b,id:"minecraft:netherrack"},{Slot:8b,id:"minecraft:netherrack"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8b,id:"minecraft:lava_bucket",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
