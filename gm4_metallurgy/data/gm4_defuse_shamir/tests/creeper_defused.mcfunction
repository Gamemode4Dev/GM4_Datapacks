# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

item replace entity @s armor.chest with iron_chestplate[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"defuse"}}]

summon creeper ~1.5 ~1 ~2.5

await delay 5s

assert entity @e[type=creeper] inside
assert entity @s[nbt={Health:20f}]
