# @template gm4:test_platform
# @dummy ~ ~1 ~

loot give @s loot gm4_ender_hoppers:items/ender_hopper
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~1 ~ ~1

assert block ~1 ~1 ~1 hopper
assert entity @e[tag=gm4_ender_hopper,distance=..3]
