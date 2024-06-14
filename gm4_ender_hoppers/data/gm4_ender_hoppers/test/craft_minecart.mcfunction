# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.1 with minecraft:minecart
item replace block ~1 ~1 ~1 container.4 with minecraft:player_head[custom_data={gm4_machines:{id:"ender_hopper"}}]

await items block ~1 ~1 ~1 container.* minecraft:hopper_minecart[count=1,custom_data~{gm4_machines:{id:"ender_hopper_minecart"}}]
