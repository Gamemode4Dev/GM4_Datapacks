# @template gm4:test_platform

setblock ~1 ~ ~1 dirt
summon armor_stand ~1.5 ~1 ~1.5
item replace entity @e[type=armor_stand,distance=..4,limit=1] weapon.mainhand with minecraft:grass_block
loot replace entity @e[type=armor_stand,distance=..4,limit=1] armor.feet loot gm4_boots_of_ostara:items/boots_of_ostara

await block ~1 ~ ~1 grass_block
