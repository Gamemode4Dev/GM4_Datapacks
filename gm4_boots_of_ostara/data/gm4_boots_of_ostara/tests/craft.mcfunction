# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:1b,id:"minecraft:wheat_seeds",Count:1b},{Slot:3b,id:"minecraft:moss_block",Count:1b},{Slot:4b,id:"minecraft:leather_boots",Count:1b},{Slot:5b,id:"minecraft:grass_block",Count:1b},{Slot:7b,id:"minecraft:water_bucket",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:leather_boots",Count:1b,tag:{gm4_boots_of_ostara:1b}},{id:"minecraft:bucket",Count:1b}]}
