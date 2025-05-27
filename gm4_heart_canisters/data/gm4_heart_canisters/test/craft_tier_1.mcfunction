# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with minecraft:obsidian
item replace block ~1 ~1 ~1 container.1 with minecraft:iron_block
item replace block ~1 ~1 ~1 container.2 with minecraft:obsidian
item replace block ~1 ~1 ~1 container.3 with minecraft:golden_apple
item replace block ~1 ~1 ~1 container.4 with minecraft:nether_star
item replace block ~1 ~1 ~1 container.5 with minecraft:golden_apple
item replace block ~1 ~1 ~1 container.6 with minecraft:obsidian
item replace block ~1 ~1 ~1 container.7 with minecraft:golden_apple
item replace block ~1 ~1 ~1 container.8 with minecraft:obsidian

await items block ~1 ~1 ~1 container.* minecraft:poisonous_potato[count=1,custom_data~{gm4_heart_canister:1b,gm4_heart_canister_tier:1b}]
