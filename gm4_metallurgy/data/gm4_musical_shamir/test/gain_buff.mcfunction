# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @timeout 150

item replace entity @s weapon.mainhand with diamond_sword[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"musical"}}]

await delay 1s

summon pig ~0.5 ~1 ~1.5 {Health:1f,Tags:[gm4_test_musical_1]}
dummy @s attack @e[type=pig,distance=..4,tag=gm4_test_musical_1,limit=1]
await delay 1s

summon pig ~0.5 ~1 ~2.5 {Health:1f,Tags:[gm4_test_musical_2]}
dummy @s attack @e[type=pig,distance=..4,tag=gm4_test_musical_2,limit=1]
await delay 1s

summon pig ~2.5 ~1 ~1.5 {Health:1f,Tags:[gm4_test_musical_3]}
dummy @s attack @e[type=pig,distance=..4,tag=gm4_test_musical_3,limit=1]
await delay 1s

assert not entity @s[nbt={active_effects:[{id:"minecraft:strength"}]}]

summon pig ~2.5 ~1 ~2.5 {Health:1f,Tags:[gm4_test_musical_4]}
dummy @s attack @e[type=pig,distance=..4,tag=gm4_test_musical_4,limit=1]

await entity @s[nbt={active_effects:[{id:"minecraft:strength"},{id:"minecraft:slowness"}]}]

dummy @s selectslot 2

await not entity @s[nbt={active_effects:[{id:"minecraft:strength"}]}]
