# @template gm4:test_platform
# @dummy ~1 ~1 ~

give @s brewing_stand
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[type=marker,tag=gm4_brewing_stand,distance=..4]

give @s lightning_rod
execute at @s run tp @s ~ ~ ~ facing ~ ~-0.5 ~1
dummy @s use block ~1 ~2 ~1

data merge block ~1 ~1 ~1 {Items:[{Slot:0b,id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:thick"}},{Slot:4b,id:"minecraft:blaze_powder",Count:1b}]}

await delay 1s

summon lightning_bolt ~1.5 ~3 ~1.5

await block ~1 ~1 ~1 brewing_stand{Items:[{Slot:0b,id:"minecraft:potion",Count:1b,tag:{gm4_lightning_in_a_bottle:1b,Potion:"gm4:lightning"}}]}
