# @template gm4:test_tube
# @dummy ~1 ~1 ~1
# Currently conflicts with Undead players, as the zombie will pick up items before Animi Shamir has a chance to track and kill them

give @s golden_leggings{gm4_metallurgy:{active_shamir:"animi"}}
give @s wooden_sword
kill @s

# await not entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:golden_leggings",Count:1b}}]
# assert entity @e[type=item,distance=..3,nbt={Item:{id:"minecraft:wooden_sword",Count:1b}}]

await delay 1s

dummy @s respawn

# await entity @p[nbt={Inventory:[{id:"minecraft:golden_leggings",Count:1b,tag:{gm4_metallurgy:{active_shamir:"animi"}}}]}]
