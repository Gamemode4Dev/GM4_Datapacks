# @template gm4:test_platform

setblock ~1 ~1 ~1 minecraft:brewing_stand
setblock ~1 ~2 ~1 minecraft:lightning_rod[facing=up]

item replace block ~1 ~1 ~1 container.0 with minecraft:potion[potion_contents="minecraft:thick"]
item replace block ~1 ~1 ~1 container.4 with minecraft:blaze_powder

await delay 1s

summon lightning_bolt ~1.5 ~3 ~1.5

await items block ~1 ~1 ~1 container.0 minecraft:potion[count=1,custom_data~{gm4_lightning_in_a_bottle:1b}]
