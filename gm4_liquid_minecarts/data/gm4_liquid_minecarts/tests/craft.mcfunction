# @template gm4_custom_crafters:test_platform

data merge block ~1 ~1 ~1 {Items:[{Slot:1b,id:"minecraft:minecart",Count:1b},{Slot:4b,id:"minecraft:player_head",tag:{gm4_machines:{id:"liquid_tank"}},Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:hopper_minecart",tag:{gm4_machines:{id:"liquid_minecart"}},Count:1b}]}
