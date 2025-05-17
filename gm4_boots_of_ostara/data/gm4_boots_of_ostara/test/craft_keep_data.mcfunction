# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.1 with minecraft:wheat_seeds
item replace block ~1 ~1 ~1 container.3 with minecraft:moss_block
item replace block ~1 ~1 ~1 container.4 with minecraft:leather_boots[damage=15]
item replace block ~1 ~1 ~1 container.5 with minecraft:grass_block
item replace block ~1 ~1 ~1 container.7 with minecraft:water_bucket

await items block ~1 ~1 ~1 container.* minecraft:leather_boots[custom_data~{gm4_boots_of_ostara:1b},damage=15]
await items block ~1 ~1 ~1 container.* minecraft:bucket[count=1]
