# @template gm4_dripleaf_filters:test_setup
# @skyaccess

item replace block ~ ~1 ~1 container.0 with minecraft:iron_ingot
summon item ~1.5 ~4 ~1.4 {Item:{id:"minecraft:gold_ingot",count:10}}

await items block ~1 ~ ~1 container.* minecraft:gold_ingot[count=10]
