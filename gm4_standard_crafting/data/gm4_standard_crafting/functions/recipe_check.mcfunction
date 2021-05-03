#@s = custom crafters with valid recipe format inside

#recipes
#sandstones to sand
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:chiseled_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:cut_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:smooth_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..32 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:sandstone_slab"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}

execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:red_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:chiseled_red_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:cut_red_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:smooth_red_sandstone"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..32 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:red_sandstone_slab"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}

#red sand
execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..8 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:sand"},{Slot:1b,id:"minecraft:sand"},{Slot:2b,id:"minecraft:sand"},{Slot:3b,id:"minecraft:sand"},{Slot:4b,id:"minecraft:red_dye"},{Slot:5b,id:"minecraft:sand"},{Slot:6b,id:"minecraft:sand"},{Slot:7b,id:"minecraft:sand"},{Slot:8b,id:"minecraft:sand"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:8}}}]}

#flint to gravel
execute if score @s gm4_slot_count matches 4 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:flint"},{Slot:1b,id:"minecraft:flint"},{Slot:3b,id:"minecraft:flint"},{Slot:4b,id:"minecraft:flint"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"gravel",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}

#cobweb
execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:string"},{Slot:1b,id:"minecraft:string"},{Slot:2b,id:"minecraft:string"},{Slot:3b,id:"minecraft:string"},{Slot:4b,id:"minecraft:slime_ball"},{Slot:5b,id:"minecraft:string"},{Slot:6b,id:"minecraft:string"},{Slot:7b,id:"minecraft:string"},{Slot:8b,id:"minecraft:string"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"cobweb",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}

#horse armour
execute if score @s gm4_slot_count matches 6 if score @s gm4_stack_size matches ..1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:2b,id:"minecraft:iron_ingot"},{Slot:3b,id:"minecraft:iron_ingot"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:iron_ingot"},{Slot:6b,id:"minecraft:iron_ingot"},{Slot:8b,id:"minecraft:iron_ingot"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"iron_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
execute if score @s gm4_slot_count matches 6 if score @s gm4_stack_size matches ..1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:2b,id:"minecraft:gold_ingot"},{Slot:3b,id:"minecraft:gold_ingot"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:gold_ingot"},{Slot:6b,id:"minecraft:gold_ingot"},{Slot:8b,id:"minecraft:gold_ingot"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"golden_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
execute if score @s gm4_slot_count matches 6 if score @s gm4_stack_size matches ..1 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:2b,id:"minecraft:diamond"},{Slot:3b,id:"minecraft:diamond"},{Slot:4b,id:"minecraft:leather"},{Slot:5b,id:"minecraft:diamond"},{Slot:6b,id:"minecraft:diamond"},{Slot:8b,id:"minecraft:diamond"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"diamond_horse_armor",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}

#notch apple
execute if score @s gm4_slot_count matches 9 if score @s gm4_stack_size matches ..64 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:gold_block"},{Slot:1b,id:"minecraft:gold_block"},{Slot:2b,id:"minecraft:gold_block"},{Slot:3b,id:"minecraft:gold_block"},{Slot:4b,id:"minecraft:apple"},{Slot:5b,id:"minecraft:gold_block"},{Slot:6b,id:"minecraft:gold_block"},{Slot:7b,id:"minecraft:gold_block"},{Slot:8b,id:"minecraft:gold_block"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"enchanted_golden_apple",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}

#quartz block nether quartz
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..16 if data storage gm4_custom_crafters:temp/crafter {Items:[{Slot:0b,id:"minecraft:quartz_block"}]} run data merge storage gm4_custom_crafters:temp/crafter {Items:[{Slot:8,id:"quartz",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}

#stairs
execute if score @s gm4_slot_count matches 4 if score @s gm4_stack_size matches ..16 run function gm4_standard_crafting:stairs_recipes
#slabs
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 run function gm4_standard_crafting:slabs_recipes
#string
execute if score @s gm4_slot_count matches 1 if score @s gm4_stack_size matches ..21 run function gm4_standard_crafting:string_recipes
