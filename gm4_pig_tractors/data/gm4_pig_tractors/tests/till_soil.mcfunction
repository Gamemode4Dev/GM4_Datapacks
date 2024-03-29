# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

setblock ~1 ~ ~1 grass_block
summon pig ~1.5 ~1 ~1.5
item replace entity @s weapon.mainhand with saddle
dummy @s use entity @e[type=pig,distance=..4,limit=1]
dummy @s use entity @e[type=pig,distance=..4,limit=1]
item replace entity @s weapon.offhand with iron_hoe

await block ~1 ~ ~1 farmland
