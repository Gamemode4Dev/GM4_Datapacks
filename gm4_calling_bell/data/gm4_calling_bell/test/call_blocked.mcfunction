# @template gm4:test_platform
# @dummy ~1 ~1 ~

setblock ~1 ~1 ~1 bell
setblock ~1 ~3 ~1 stone
execute at @s run tp @s ~ ~ ~ facing ~ ~-1 ~1
give @s emerald
dummy @s use block ~1.4 ~1.25 ~1.5 north

await delay 1s

assert not entity @e[type=wandering_trader,distance=..4]
assert items entity @s weapon.mainhand minecraft:emerald
