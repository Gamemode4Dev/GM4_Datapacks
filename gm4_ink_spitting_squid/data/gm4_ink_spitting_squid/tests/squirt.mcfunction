# @template gm4_ink_spitting_squid:test_tank
# @dummy ~1 ~1 ~1

summon squid ~2 ~1 ~2

await entity @s[nbt={active_effects:[{id:"minecraft:blindness",amplifier:0b},{id:"minecraft:nausea",amplifier:0b}]}]
