# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with minecraft:iron_ingot
item replace block ~1 ~1 ~1 container.1 with minecraft:purpur_block
item replace block ~1 ~1 ~1 container.2 with minecraft:iron_ingot
item replace block ~1 ~1 ~1 container.3 with minecraft:piston
item replace block ~1 ~1 ~1 container.4 with minecraft:obsidian
item replace block ~1 ~1 ~1 container.5 with minecraft:piston
item replace block ~1 ~1 ~1 container.6 with minecraft:cobblestone
item replace block ~1 ~1 ~1 container.7 with minecraft:cobblestone
item replace block ~1 ~1 ~1 container.8 with minecraft:cobblestone

await items block ~1 ~1 ~1 container.* minecraft:player_head[custom_data~{gm4_machines:{id:"block_compressor"}}]
