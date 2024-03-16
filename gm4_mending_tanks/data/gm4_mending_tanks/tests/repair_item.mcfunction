# @template gm4_liquid_tanks:test_setup

item replace block ~1 ~3 ~1 container.0 with minecraft:experience_bottle 10

await block ~1 ~3 ~1 hopper{Items:[{id:"minecraft:glass_bottle"}]}

item replace block ~1 ~3 ~1 container.0 with air

await delay 1s

item replace block ~1 ~3 ~1 container.0 with minecraft:elytra{Damage:80,Enchantments:[{id:"minecraft:mending",lvl:1}]}

await block ~1 ~3 ~1 hopper{Items:[{id:"minecraft:elytra",tag:{Damage:0}}]}
