# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:1b,id:"minecraft:ender_eye",Count:1b},{Slot:4b,id:"minecraft:respawn_anchor",Count:1b},{Slot:7b,id:"minecraft:hopper",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:player_head",tag:{gm4_machines:{id:"ender_hopper"}},Count:1b}]}
