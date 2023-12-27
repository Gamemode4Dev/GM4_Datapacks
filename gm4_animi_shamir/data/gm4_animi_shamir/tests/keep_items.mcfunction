# @dummy

give @s golden_leggings{gm4_metallurgy:{active_shamir:"animi"}}
give @s wooden_sword
kill @s

await not entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:golden_leggings",Count:1b}}]
assert entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}]

await for 1s

dummy @s respawn

await entity @p[nbt={Inventory:[{id:"minecraft:golden_leggings",Count:1b,tag:{gm4_metallurgy:{active_shamir:"animi"}}}]}]
