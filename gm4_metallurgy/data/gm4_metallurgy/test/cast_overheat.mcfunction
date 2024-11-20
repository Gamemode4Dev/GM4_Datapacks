# @template gm4_metallurgy:test_casting
# @timeout 600

summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:obsidian"}}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:clay_ball"}}

await entity @e[tag=gm4_sand_ring] inside

setblock ~1 ~2 ~1 lava

await delay 22s

assert entity @e[tag=gm4_sand_ring] inside

await delay 2s

assert not entity @e[tag=gm4_sand_ring] inside
assert block ~1 ~2 ~1 lava[level=0]
