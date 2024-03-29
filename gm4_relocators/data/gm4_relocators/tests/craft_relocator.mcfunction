# @template gm4_custom_crafters:test_platform

item replace block ~1 ~1 ~1 container.0 with crying_obsidian
item replace block ~1 ~1 ~1 container.1 with shulker_shell
item replace block ~1 ~1 ~1 container.2 with crying_obsidian
item replace block ~1 ~1 ~1 container.3 with amethyst_shard
item replace block ~1 ~1 ~1 container.4 with enchanted_book{StoredEnchantments:[{id:"minecraft:silk_touch",lvl:1}]}
item replace block ~1 ~1 ~1 container.5 with amethyst_shard
item replace block ~1 ~1 ~1 container.6 with crying_obsidian
item replace block ~1 ~1 ~1 container.7 with shulker_shell
item replace block ~1 ~1 ~1 container.8 with crying_obsidian

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:player_head",Count:1b,tag:{gm4_machines:{id:"relocator_empty"}}}]}
