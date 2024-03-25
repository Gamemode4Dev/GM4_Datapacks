# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.1 with minecraft:piston
item replace block ~1 ~1 ~1 container.3 with minecraft:cobblestone
item replace block ~1 ~1 ~1 container.4 with minecraft:comparator
item replace block ~1 ~1 ~1 container.5 with minecraft:cobblestone
item replace block ~1 ~1 ~1 container.6 with minecraft:cobblestone
item replace block ~1 ~1 ~1 container.7 with minecraft:furnace
item replace block ~1 ~1 ~1 container.8 with minecraft:cobblestone

await items block ~1 ~1 ~1 container.* minecraft:player_head[count=1,custom_data~{gm4_machines:{id:"forming_press"}}]
