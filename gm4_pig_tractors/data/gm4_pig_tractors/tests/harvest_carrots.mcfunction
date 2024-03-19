# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

setblock ~1 ~ ~1 farmland
setblock ~1 ~1 ~1 carrots[age=7]
summon pig ~1.5 ~1 ~1.5 {Saddle:1b}
dummy @s use entity @e[type=pig,distance=..4,limit=1]

await block ~1 ~1 ~1 carrots[age=0]
assert entity @s[nbt={Inventory:[{id:"minecraft:carrot"}]}]
