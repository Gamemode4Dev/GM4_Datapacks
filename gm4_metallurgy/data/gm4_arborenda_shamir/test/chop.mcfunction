# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

setblock ~1 ~ ~1 dirt
setblock ~1 ~1 ~1 birch_log
setblock ~1 ~2 ~1 birch_log
setblock ~1 ~3 ~1 birch_log
setblock ~1 ~4 ~2 birch_log

give @s minecraft:iron_axe[damage=10,custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"arborenda"}}]

dummy @s mine ~1 ~2 ~1

await delay 2s

assert block ~1 ~1 ~1 birch_log
assert block ~1 ~2 ~1 air
assert block ~1 ~3 ~1 air
assert block ~1 ~4 ~2 air

assert items entity @s weapon.mainhand *[damage=13]
