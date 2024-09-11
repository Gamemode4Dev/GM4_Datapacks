# @template gm4:test_platform
# @dummy ~1 ~1 ~

give @s brewing_stand
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[type=marker,tag=gm4_brewing_stand,distance=..4]

give @s lightning_rod
execute at @s run tp @s ~ ~ ~ facing ~ ~-0.5 ~1
dummy @s use block ~1 ~2 ~1

item replace block ~1 ~1 ~1 container.0 with minecraft:potion[potion_contents="minecraft:thick"]
item replace block ~1 ~1 ~1 container.4 with minecraft:blaze_powder

await delay 1s

summon lightning_bolt ~1.5 ~3 ~1.5

await items block ~1 ~1 ~1 container.0 minecraft:potion[count=1,custom_data~{gm4_lightning_in_a_bottle:1b}]
