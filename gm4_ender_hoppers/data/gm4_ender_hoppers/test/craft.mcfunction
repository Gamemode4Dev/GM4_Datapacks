# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.1 with minecraft:ender_eye
item replace block ~1 ~1 ~1 container.4 with minecraft:respawn_anchor
item replace block ~1 ~1 ~1 container.7 with minecraft:hopper

await items block ~1 ~1 ~1 container.* minecraft:player_head[count=1,custom_data~{gm4_machines:{id:"ender_hopper"}}]
