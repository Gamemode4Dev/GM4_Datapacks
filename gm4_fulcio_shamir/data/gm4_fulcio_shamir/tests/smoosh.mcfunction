# @template gm4_metallurgy:test_smooshing

loot spawn ~1.5 ~2.5 ~1.8 loot gm4_fulcio_shamir:band
summon item ~1.5 ~2.5 ~1.8 {Item:{id:"minecraft:compass",Count:1b}}

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await entity @e[type=item,distance=..4,nbt={Item:{id:"minecraft:compass",Count:1b,tag:{gm4_metallurgy:{active_shamir:"fulcio"}}}}]
assert entity @e[type=item,distance=..4,nbt={Item:{id:"minecraft:obsidian",Count:1b}}]
