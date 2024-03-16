# @template gm4_metallurgy:test_casting

summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:obsidian",Count:1b}}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:clay_ball",Count:1b}}

await entity @e[tag=gm4_sand_ring] inside

setblock ~1 ~1 ~1 air

await entity @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:1b}}] inside
assert not entity @e[type=item,nbt={Item:{id:"minecraft:clay_ball",Count:1b}}] inside
