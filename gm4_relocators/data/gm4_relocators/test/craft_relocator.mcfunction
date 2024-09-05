# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with crying_obsidian
item replace block ~1 ~1 ~1 container.1 with shulker_shell
item replace block ~1 ~1 ~1 container.2 with crying_obsidian
item replace block ~1 ~1 ~1 container.3 with amethyst_shard
item replace block ~1 ~1 ~1 container.4 with enchanted_book[stored_enchantments={silk_touch:1}]
item replace block ~1 ~1 ~1 container.5 with amethyst_shard
item replace block ~1 ~1 ~1 container.6 with crying_obsidian
item replace block ~1 ~1 ~1 container.7 with shulker_shell
item replace block ~1 ~1 ~1 container.8 with crying_obsidian

await items block ~1 ~1 ~1 container.* minecraft:player_head[custom_data~{gm4_machines:{id:"relocator_empty"}}]
