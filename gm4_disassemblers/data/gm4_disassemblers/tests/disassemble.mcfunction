# @template gm4:test_platform
# @dummy ~ ~1 ~

loot give @s loot gm4_disassemblers:items/disassembler
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~1 ~ ~1

assert block ~1 ~1 ~1 dropper
assert entity @e[tag=gm4_disassembler,distance=..3]

item replace block ~1 ~1 ~1 container.0 with minecraft:iron_chestplate

await items block ~1 ~1 ~1 container.0 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.2 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.3 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.4 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.5 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.6 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.7 minecraft:iron_ingot[count=1]
assert items block ~1 ~1 ~1 container.8 minecraft:iron_ingot[count=1]
