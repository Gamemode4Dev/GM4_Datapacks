# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:0b,id:"minecraft:obsidian",Count:1b},{Slot:1b,id:"minecraft:iron_block",Count:1b},{Slot:2b,id:"minecraft:obsidian",Count:1b},{Slot:3b,id:"minecraft:golden_apple",Count:1b},{Slot:4b,id:"minecraft:nether_star",Count:1b},{Slot:5b,id:"minecraft:golden_apple",Count:1b},{Slot:6b,id:"minecraft:obsidian",Count:1b},{Slot:7b,id:"minecraft:golden_apple",Count:1b},{Slot:8b,id:"minecraft:obsidian",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:player_head",tag:{gm4_heart_canister:1b,gm4_heart_canister_tier:1b}}]}
