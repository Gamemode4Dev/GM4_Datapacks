# @template gm4:test_platform
# @dummy ~ ~1 ~

execute positioned ~1.5 ~1.5 ~1.5 run function gm4_block_compressors:machine/create
give @s diamond_pickaxe
dummy @s mine ~1 ~1 ~1

assert items entity @e[type=item,distance=..3] contents minecraft:dropper[count=1]

await items entity @e[type=item,distance=..3] contents minecraft:player_head[count=1,custom_data~{gm4_machines:{id:"block_compressor"}}]
