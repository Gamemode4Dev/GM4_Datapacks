# @template gm4:test_platform
# @dummy ~1 ~1 ~1

setblock ~1 ~ ~1 dirt
give @s grass_block
dummy @s swap
loot give @s loot gm4_boots_of_ostara:items/boots_of_ostara

dummy @s use item

await block ~1 ~ ~1 grass_block
