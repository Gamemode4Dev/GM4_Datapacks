# @template gm4:test_platform
# @dummy ~ ~1 ~
# @optional

setblock ~1 ~1 ~1 rail
loot give @s loot gm4_liquid_minecarts:items/liquid_minecart
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[tag=gm4_liquid_minecart,distance=..3]
