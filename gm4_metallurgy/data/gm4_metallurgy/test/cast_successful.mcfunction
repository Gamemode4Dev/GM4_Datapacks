# @template gm4_metallurgy:test_casting
# @timeout 400

summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:obsidian"}}
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:clay_ball"}}

await entity @e[tag=gm4_sand_ring] inside

setblock ~1 ~2 ~1 lava

await delay 10s

setblock ~1 ~2 ~1 air
summon item ~1.5 ~3 ~1.5 {Item:{id:"minecraft:player_head",components:{"minecraft:custom_data":{gm4_metallurgy:{item:"ore",metal:{castable:1b,type:"barium",amount:[1s]}}}}}}

await delay 2s

scoreboard players set @e[tag=gm4_sand_ring,distance=..4] gm4_ml_ore_ba 23

await delay 3s

setblock ~1 ~1 ~1 air

await items entity @e[type=item,distance=..4] contents minecraft:player_head[custom_data~{gm4_metallurgy:{item:"obsidian_cast",has_shamir:1b,metal:{castable:1b,type:"barium",amount:[12s]}}}]
