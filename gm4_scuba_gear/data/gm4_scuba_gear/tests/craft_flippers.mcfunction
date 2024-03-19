# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with scute
item replace block ~1 ~1 ~1 container.2 with scute
item replace block ~1 ~1 ~1 container.3 with rabbit_hide
item replace block ~1 ~1 ~1 container.5 with rabbit_hide
item replace block ~1 ~1 ~1 container.6 with rabbit_hide
item replace block ~1 ~1 ~1 container.8 with rabbit_hide

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:leather_boots",Count:1b,tag:{gm4_scuba_gear:{item:"flippers"}}}]}
