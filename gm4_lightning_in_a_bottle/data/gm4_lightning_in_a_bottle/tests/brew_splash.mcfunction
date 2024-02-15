# @template gm4:test_platform
# @dummy ~1 ~1 ~

give @s brewing_stand
execute at @s run tp @s ~ ~ ~ facing ~ ~-1.5 ~1
dummy @s use block ~1 ~1 ~1

await entity @e[type=marker,tag=gm4_brewing_stand,distance=..4]

data merge block ~1 ~1 ~1 {Items:[{Slot:0b,id:"minecraft:potion",Count:1b,tag:{gm4_lightning_in_a_bottle:1b,Potion:"gm4:lightning"}},{Slot:3b,id:"minecraft:gunpowder",Count:1b},{Slot:4b,id:"minecraft:blaze_powder",Count:1b}]}

await delay 1t

data merge block ~1 ~1 ~1 {BrewTime:40s}

await block ~1 ~1 ~1 brewing_stand{Items:[{Slot:0b,id:"minecraft:splash_potion",Count:1b,tag:{gm4_lightning_in_a_bottle:1b,Potion:"gm4:lightning"}}]}
