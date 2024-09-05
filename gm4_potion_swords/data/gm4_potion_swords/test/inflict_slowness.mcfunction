# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

summon zombie ~1.5 ~1 ~2.5
item replace entity @s weapon.mainhand with minecraft:golden_sword
item replace entity @s weapon.offhand with minecraft:potion[potion_contents="minecraft:long_slowness"]
dummy @s attack @e[type=zombie,distance=..4,limit=1]

await entity @e[type=zombie,distance=..4,nbt={active_effects:[{id:"minecraft:slowness"}]}]
