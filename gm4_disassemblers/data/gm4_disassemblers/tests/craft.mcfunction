# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:0b,id:"minecraft:iron_ingot",Count:1b},{Slot:1b,id:"minecraft:tnt",Count:1b},{Slot:2b,id:"minecraft:iron_ingot",Count:1b},{Slot:3b,id:"minecraft:obsidian",Count:1b},{Slot:4b,id:"minecraft:stonecutter",Count:1b},{Slot:5b,id:"minecraft:obsidian",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:cobblestone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:player_head",tag:{gm4_machines:{id:"disassembler"}},Count:1b}]}
