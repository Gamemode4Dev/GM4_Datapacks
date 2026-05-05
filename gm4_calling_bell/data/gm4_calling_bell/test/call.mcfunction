# @template gm4:test_platform
# @dummy ~1 ~1 ~
# @skyaccess

setblock ~1 ~1 ~1 bell
execute at @s run tp @s ~ ~ ~ facing ~ ~-1 ~1
give @s emerald
dummy @s use block ~1.4 ~1.25 ~1.5 north
# any_block_use isnt triggering for   dummy @s use block
advancement grant @s only gm4_calling_bell:ring_bell

await entity @e[type=wandering_trader,distance=..4]

assert not items entity @s weapon.mainhand minecraft:emerald
