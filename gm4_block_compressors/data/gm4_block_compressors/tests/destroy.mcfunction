# @template gm4:test_platform
# @dummy ~ ~1 ~

execute positioned ~1.5 ~1.5 ~1.5 run function gm4_block_compressors:machine/create
give @s diamond_pickaxe
dummy @s mine ~1 ~1 ~1

assert entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:dropper",Count:1b}}]

await entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:player_head",tag:{gm4_machines:{id:"block_compressor"}},Count:1b}}]
