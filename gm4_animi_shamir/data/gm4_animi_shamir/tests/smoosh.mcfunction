# @template gm4_metallurgy:test_smooshing

loot spawn ~1.5 ~2.5 ~1.8 loot gm4_animi_shamir:band
summon item ~1.5 ~2.5 ~1.8 {Item:{id:"minecraft:diamond_leggings"}}

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await items entity @e[type=item,distance=..4] contents diamond_leggings[custom_data~{gm4_metallurgy:{active_shamir:"animi"}}]
assert items entity @e[type=item,distance=..4] contents obsidian
