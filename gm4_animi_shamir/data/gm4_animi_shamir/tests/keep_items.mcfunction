# @template gm4:test_tube
# @dummy ~1 ~1 ~1

give @s golden_leggings{gm4_metallurgy:{active_shamir:"animi"}}
give @s wooden_sword
kill @s

await entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}]
assert not entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:golden_leggings",Count:1b}}]

await delay 1s

kill @e[type=zombie,distance=..3]
kill @e[type=item,distance=..3]

await delay 1s

dummy @s respawn

await entity @p[nbt={Inventory:[{id:"minecraft:golden_leggings",Count:1b,tag:{gm4_metallurgy:{active_shamir:"animi"}}}]}]
