# @template gm4:test_platform

setblock ~1 ~1 ~1 minecraft:brewing_stand

loot replace block ~1 ~1 ~1 container.0 loot gm4_lightning_in_a_bottle:items/bottle_of_lightning
item replace block ~1 ~1 ~1 container.3 with minecraft:gunpowder
item replace block ~1 ~1 ~1 container.4 with minecraft:blaze_powder

await delay 1t

data merge block ~1 ~1 ~1 {BrewTime:40}

await items block ~1 ~1 ~1 container.0 minecraft:splash_potion[custom_data~{gm4_lightning_in_a_bottle:1b}]
