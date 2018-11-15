#@s = custom crafters with valid recipe format inside

#recipes
#smooth sandstone
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sandstone_slab"},{Slot:1b,id:"minecraft:sandstone_slab"},{Slot:3b,id:"minecraft:sandstone_slab"},{Slot:4b,id:"minecraft:sandstone_slab"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"smooth_sandstone",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:red_sandstone_slab"},{Slot:1b,id:"minecraft:red_sandstone_slab"},{Slot:3b,id:"minecraft:red_sandstone_slab"},{Slot:4b,id:"minecraft:red_sandstone_slab"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"smooth_red_sandstone",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}

#double stone stone slab
execute if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:stone_slab"},{Slot:1b,id:"minecraft:stone_slab"},{Slot:3b,id:"minecraft:stone_slab"},{Slot:4b,id:"minecraft:stone_slab"}]} run data merge block ~ ~ ~ {Items:[{Slot:8,id:"smooth_stone",Count:1b,tag:{gm4_custom_crafters:{multiplier:2}}}]}

#stairs
execute if score @s gm4_stack_size matches ..10 run function standard_crafting:quadruple_10
