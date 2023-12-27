# @template gm4:test_platform
# @dummy ~ ~1 ~

loot give @s loot gm4_disassemblers:items/disassembler
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~1 ~ ~1

assert block ~1 ~1 ~1 dropper
assert entity @e[tag=gm4_disassembler,distance=..3]

data merge block ~1 ~1 ~1 {Items:[{id:"minecraft:iron_chestplate",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{Slot:0b,id:"minecraft:iron_ingot",Count:1b},{Slot:2b,id:"minecraft:iron_ingot",Count:1b},{Slot:3b,id:"minecraft:iron_ingot",Count:1b},{Slot:4b,id:"minecraft:iron_ingot",Count:1b},{Slot:5b,id:"minecraft:iron_ingot",Count:1b},{Slot:6b,id:"minecraft:iron_ingot",Count:1b},{Slot:7b,id:"minecraft:iron_ingot",Count:1b},{Slot:8b,id:"minecraft:iron_ingot",Count:1b}]}
