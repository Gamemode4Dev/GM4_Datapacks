# @template gm4:test_platform
# @skyaccess

execute positioned ~1.5 ~1.5 ~1.5 run function gm4_block_compressors:machine/create
item replace block ~1 ~1 ~1 container.0 with cobblestone
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:diamond"}}

await items entity @e[type=item,distance=..4] contents diamond[custom_data~{gm4_block_compressors:{compression_level:7}}]
