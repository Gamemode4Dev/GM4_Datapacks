# @template gm4_metallurgy:test_casting

summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:obsidian"}}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:clay_ball"}}

await entity @e[tag=gm4_sand_ring] inside

setblock ~1 ~1 ~1 air

await items entity @e[type=item,distance=..4] contents minecraft:obsidian
assert not items entity @e[type=item,distance=..4] contents minecraft:clay_ball
