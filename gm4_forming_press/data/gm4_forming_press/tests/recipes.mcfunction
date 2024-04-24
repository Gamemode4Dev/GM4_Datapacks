# @template gm4_forming_press:test_platform

item replace block ~1 ~1 ~1 container.0 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.1 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.2 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.3 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.4 with minecraft:clay_ball 2
item replace block ~1 ~1 ~1 container.5 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.6 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.7 with minecraft:chorus_fruit 2
item replace block ~1 ~1 ~1 container.8 with minecraft:chorus_fruit 2

await items block ~1 ~1 ~1 container.* minecraft:purpur_block[count=32]
