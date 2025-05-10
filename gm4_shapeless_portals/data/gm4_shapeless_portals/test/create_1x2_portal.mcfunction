# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @optional

fill ~ ~ ~1 ~2 ~3 ~1 obsidian
fill ~1 ~1 ~1 ~1 ~2 ~1 air
execute at @s run tp @s ~ ~ ~ facing ~ ~-2 ~1
item replace entity @s weapon.mainhand with flint_and_steel
dummy @s use block ~1 ~ ~1 up

await block ~1 ~1 ~1 nether_portal
assert block ~1 ~2 ~1 nether_portal
