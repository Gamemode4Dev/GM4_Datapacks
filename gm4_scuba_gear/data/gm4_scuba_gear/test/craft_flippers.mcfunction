# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with turtle_scute
item replace block ~1 ~1 ~1 container.2 with turtle_scute
item replace block ~1 ~1 ~1 container.3 with dried_kelp
item replace block ~1 ~1 ~1 container.5 with dried_kelp
item replace block ~1 ~1 ~1 container.6 with dried_kelp
item replace block ~1 ~1 ~1 container.8 with dried_kelp

await items block ~1 ~1 ~1 container.* minecraft:leather_boots[custom_data~{gm4_scuba_gear:{item:"flippers"}}]
