#@s = custom crafters with valid recipe format inside

#recipes
#sandstones to sand
execute score @s gm4_stack_size matches ..16 run function standard_crafting:single_16
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sandstone_slab"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:red_sandstone_slab"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}
