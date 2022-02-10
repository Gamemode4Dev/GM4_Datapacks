# run from #gm4_custom_crafters:recipe_check
execute if entity @s[name=gm4_custom_crafter] if score @s gm4_slot_count matches 8 if score @s gm4_stack_size matches 1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:cobblestone"},{Slot:1b,id:"minecraft:piston"},{Slot:2b,id:"minecraft:cobblestone"},{Slot:3b,id:"minecraft:piston"},{Slot:5b,id:"minecraft:piston"},{Slot:6b,id:"minecraft:comparator"},{Slot:7b,id:"minecraft:furnace"},{Slot:8b,id:"minecraft:comparator"}]} run function gm4_master_crafting:create

# run master crafter recipes, all master crafter recipes fill all nine slots
execute if entity @s[name=gm4_master_crafter] if score @s gm4_slot_count matches 9 run function #gm4_master_crafting:recipe_check
