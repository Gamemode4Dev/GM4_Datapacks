# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5
# @timeout 900

item replace entity @s weapon.mainhand with blast_furnace
execute at @s run tp @s ~ ~ ~ facing ~ ~-1 ~1
dummy @s use block ~1 ~ ~1 up
assert block ~1 ~1 ~1 blast_furnace

item replace block ~1 ~1 ~1 container.0 with soul_sand
item replace block ~1 ~1 ~1 container.1 with coal

await items block ~1 ~1 ~1 container.2 minecraft:brown_stained_glass[custom_data~{gm4_soul_glass:1b}]
