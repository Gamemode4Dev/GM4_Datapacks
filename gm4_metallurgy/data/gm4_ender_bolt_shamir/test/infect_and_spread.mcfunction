# @template gm4:test_platform
# @dummy ~0.5 ~1 ~0.5

give @s iron_sword[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"ender_bolt"}}]

await delay 1s

summon pig ~0.5 ~1 ~2.5 {NoAI:1b}
dummy @s attack @e[type=pig,distance=..4,limit=1]

await entity @e[type=pig,nbt={active_effects:[{id:"minecraft:wither"}]}]

summon pig ~1.5 ~1 ~2.5 {NoAI:1b,Tags:[gm4_test_ender_bolt]}

await entity @e[type=pig,tag=gm4_test_ender_bolt,nbt={active_effects:[{id:"minecraft:wither"}]}]
