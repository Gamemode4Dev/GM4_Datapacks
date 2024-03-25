# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @optional

execute positioned ~1.5 ~1 ~2.5 run dummy potionswords2 spawn
await delay 3s

item replace entity @s weapon.mainhand with minecraft:golden_sword
item replace entity @s weapon.offhand with minecraft:potion[potion_contents="minecraft:long_invisibility"]
dummy @s attack @e[type=player,name=potionswords2,distance=..4,limit=1]

await entity @e[type=player,name=potionswords2,distance=..4,nbt={active_effects:[{id:"minecraft:invisibility"}]}]
