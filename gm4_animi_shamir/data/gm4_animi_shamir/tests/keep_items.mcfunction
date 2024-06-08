# @template gm4:test_tube
# @dummy ~1 ~1 ~1
# @optional

give @s golden_leggings[custom_data={gm4_metallurgy:{active_shamir:"animi"}}]
give @s wooden_sword
kill @s

assert items entity @e[type=item,distance=..3] contents wooden_sword
assert not items entity @e[type=item,distance=..3] contents golden_leggings

await delay 1s

kill @e[type=zombie,distance=..3]
kill @e[type=item,distance=..3]

await delay 1s

dummy @s respawn

await items entity @p container.* golden_leggings[custom_data~{gm4_metallurgy:{active_shamir:"animi"}}]
