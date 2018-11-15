#@s = custom crafters with valid recipe format inside

#recipes
#sandstones to sand
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:chiseled_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:cut_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:smooth_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}

execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:red_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:chiseled_red_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:cut_red_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:smooth_red_sandstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:4}}}]}
