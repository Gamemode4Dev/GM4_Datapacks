#@s = lava tank below a cauldron, at the cauldron
# run from standard_liquids:util/drain_cauldron

scoreboard players add @s gm4_lt_value 3
setblock ~ ~ ~ cauldron
playsound item.bucket.fill_lava block @a[distance=..10]
