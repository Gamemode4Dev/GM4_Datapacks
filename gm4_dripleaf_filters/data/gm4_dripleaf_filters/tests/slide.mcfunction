# @template gm4_dripleaf_filters:test_setup

data merge block ~ ~1 ~1 {Items:[{id:"minecraft:iron_ingot",Count:1b}]}

summon item ~1.5 ~4 ~1.4 {Item:{id:"minecraft:iron_ingot",Count:10b}}

await block ~ ~1 ~1 hopper{Items:[{id:"minecraft:iron_ingot",Count:11b}]}
assert not block ~1 ~ ~1 hopper{Items:[{}]}
