#@s = custom crafters with valid recipe format inside

#recipes
#red sand
execute if score @s gm4_stack_size matches ..8 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sand"},{Slot:1b,id:"minecraft:sand"},{Slot:2b,id:"minecraft:sand"},{Slot:3b,id:"minecraft:sand"},{Slot:4b,id:"minecraft:rose_red"},{Slot:5b,id:"minecraft:sand"},{Slot:6b,id:"minecraft:sand"},{Slot:7b,id:"minecraft:sand"},{Slot:8b,id:"minecraft:sand"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"red_sand",Count:1b,tag:{gm4_custom_crafters:{multiplier:8}}}]}

#flint to gravel
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:flint"},{Slot:1b,id:"minecraft:flint"},{Slot:2b,id:"minecraft:flint"},{Slot:3b,id:"minecraft:flint"},{Slot:4b,id:"minecraft:flint"},{Slot:5b,id:"minecraft:flint"},{Slot:6b,id:"minecraft:flint"},{Slot:7b,id:"minecraft:flint"},{Slot:8b,id:"minecraft:flint"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"gravel",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
#cobweb
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:string"},{Slot:1b,id:"minecraft:string"},{Slot:2b,id:"minecraft:string"},{Slot:3b,id:"minecraft:string"},{Slot:4b,id:"minecraft:slime_ball"},{Slot:5b,id:"minecraft:string"},{Slot:6b,id:"minecraft:string"},{Slot:7b,id:"minecraft:string"},{Slot:8b,id:"minecraft:string"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"cobweb",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
#notch apple
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:gold_block"},{Slot:1b,id:"minecraft:gold_block"},{Slot:2b,id:"minecraft:gold_block"},{Slot:3b,id:"minecraft:gold_block"},{Slot:4b,id:"minecraft:apple"},{Slot:5b,id:"minecraft:gold_block"},{Slot:6b,id:"minecraft:gold_block"},{Slot:7b,id:"minecraft:gold_block"},{Slot:8b,id:"minecraft:gold_block"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"enchanted_golden_apple",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}}}]}
