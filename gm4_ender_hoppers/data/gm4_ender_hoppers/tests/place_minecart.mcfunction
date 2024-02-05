# @template gm4:test_platform
# @dummy ~ ~1 ~
# @optional

setblock ~1 ~1 ~1 rail
loot give @s loot gm4_ender_hoppers:items/ender_hopper_minecart
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[tag=gm4_ender_hopper_minecart,distance=..3]
