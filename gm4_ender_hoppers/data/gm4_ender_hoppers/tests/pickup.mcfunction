# @template gm4_ender_hoppers:test_pickup

summon item ~2.5 ~1.5 ~1.5 {Item:{id:"minecraft:iron_ingot"}}
summon item ~5.5 ~1.5 ~1.5 {Item:{id:"minecraft:gold_ingot"}}
summon item ~6.5 ~1.5 ~1.5 {Item:{id:"minecraft:diamond"}}

await items block ~1 ~ ~1 container.* minecraft:iron_ingot
await items block ~1 ~ ~1 container.* minecraft:gold_ingot

await delay 1s

assert not items block ~1 ~ ~1 container.* minecraft:diamond
execute positioned ~7 ~ ~ run assert items entity @e[type=item,distance=..2] contents minecraft:diamond
