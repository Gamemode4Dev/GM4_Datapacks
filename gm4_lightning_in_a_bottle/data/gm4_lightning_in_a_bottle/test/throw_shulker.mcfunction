# @template gm4:test_platform
# @dummy ~1 ~1 ~

setblock ~1 ~ ~1 purpur_block
loot give @s loot gm4_lightning_in_a_bottle:items/splash_bottle_of_lightning
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1
dummy @s use item

await entity @e[type=shulker,distance=..4]
