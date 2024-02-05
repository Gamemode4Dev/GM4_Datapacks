# @template gm4_ender_hoppers:test_pickup

summon item ~2.5 ~1.5 ~1.5 {Item:{id:"minecraft:iron_ingot",Count:1b}}
summon item ~5.5 ~1.5 ~1.5 {Item:{id:"minecraft:gold_ingot",Count:1b}}
summon item ~6.5 ~1.5 ~1.5 {Item:{id:"minecraft:diamond",Count:1b}}

await block ~1 ~ ~1 hopper{Items:[{id:"minecraft:iron_ingot",Count:1b},{id:"minecraft:gold_ingot"}]}

await delay 1s

assert not block ~1 ~ ~1 hopper{Items:[{id:"minecraft:diamond",Count:1b}]}
execute positioned ~7 ~ ~ run assert entity @e[type=item,distance=..2,nbt={Item:{id:"minecraft:diamond",Count:1b}}]
