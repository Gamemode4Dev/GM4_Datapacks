# @template gm4_metallurgy:test_smooshing

loot spawn ~1.5 ~2.5 ~1.8 loot gm4_fulcio_shamir:band
summon item ~1.5 ~2.5 ~1.8 {Item:{id:"minecraft:compass"}}

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await items entity @e[type=item,distance=..4] contents minecraft:compass[count=1,custom_data~{gm4_metallurgy:{active_shamir:"fulcio"}}]
assert items entity @e[type=item,distance=..4] contents minecraft:obsidian[count=1]
