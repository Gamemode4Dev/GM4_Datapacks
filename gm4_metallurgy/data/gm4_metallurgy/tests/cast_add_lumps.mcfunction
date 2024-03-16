# @template gm4_metallurgy:test_casting
# @timeout 300

summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:obsidian",Count:1b}}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:clay_ball",Count:1b}}

await entity @e[tag=gm4_sand_ring] inside

setblock ~1 ~2 ~1 lava

await delay 10s

setblock ~1 ~2 ~1 air
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_metallurgy:{item:"ore",metal:{castable:1b,type:"barium",amount:[1s]}}}}}

await delay 2s

setblock ~1 ~1 ~1 air

await entity @e[type=item,nbt={Item:{id:"minecraft:magma_block",Count:1b}}] inside
