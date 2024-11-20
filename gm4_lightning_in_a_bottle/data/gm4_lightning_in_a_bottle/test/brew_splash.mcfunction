# @template gm4:test_platform
# @dummy ~1 ~1 ~

item replace entity @s weapon.mainhand with minecraft:brewing_stand
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[type=marker,tag=gm4_brewing_stand,distance=..4]

loot replace block ~1 ~1 ~1 container.0 loot gm4_lightning_in_a_bottle:items/bottle_of_lightning
item replace block ~1 ~1 ~1 container.3 with minecraft:gunpowder
item replace block ~1 ~1 ~1 container.4 with minecraft:blaze_powder

await delay 1t

data merge block ~1 ~1 ~1 {BrewTime:40s}

await items block ~1 ~1 ~1 container.0 minecraft:splash_potion[custom_data~{gm4_lightning_in_a_bottle:1b}]
