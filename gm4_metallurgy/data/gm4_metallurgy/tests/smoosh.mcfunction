# @template gm4_metallurgy:test_smooshing

loot spawn ~1.5 ~2.5 ~1.8 loot gm4_hypexperia_shamir:band
summon item ~1.5 ~2.5 ~1.8 {Item:{id:"minecraft:diamond_sword",Count:1b}}

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await entity @e[type=item,nbt={Item:{id:"minecraft:diamond_sword",Count:1b,tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}}] inside
assert entity @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:1b}}] inside
