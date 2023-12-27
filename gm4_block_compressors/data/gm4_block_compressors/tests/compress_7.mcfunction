# @template gm4:test_platform

execute positioned ~1.5 ~1.5 ~1.5 run function gm4_block_compressors:machine/create
data merge block ~1 ~1 ~1 {Items:[{Slot:0b,id:"minecraft:cobblestone",Count:7b}]}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:diamond",Count:7b}}

await entity @e[type=item,nbt={Item:{id:"minecraft:diamond",Count:1b,tag:{gm4_block_compressors:{compression_level:7}}}}]
