# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

setblock ~1 ~3 ~1 gray_concrete
summon skeleton ~1.5 ~1 ~2.5
item replace entity @s weapon.mainhand with minecraft:golden_sword
item replace entity @s weapon.offhand with minecraft:potion[potion_contents="minecraft:strong_poison"]
dummy @s attack @e[type=skeleton,distance=..4,limit=1]

await entity @e[type=wither_skeleton,distance=..4]
assert not entity @e[type=skeleton,distance=..4]
