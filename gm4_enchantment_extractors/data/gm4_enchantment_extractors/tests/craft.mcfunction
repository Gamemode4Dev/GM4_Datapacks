# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:1b,id:"minecraft:enchanting_table",Count:1b},{Slot:3b,id:"minecraft:gold_ingot",Count:1b},{Slot:4b,id:"minecraft:grindstone",Count:1b},{Slot:5b,id:"minecraft:gold_ingot",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:cobblestone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:player_head",tag:{gm4_machines:{id:"enchantment_extractor"}},Count:1b}]}
