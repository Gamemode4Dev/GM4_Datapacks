# @template gm4_liquid_minecarts:test_transport
# @dummy ~1 ~1 ~

execute positioned ~2 ~1 ~2 run tag @e[tag=gm4_liquid_tank,distance=..1] add test_source
execute positioned ~4 ~1 ~1 run tag @e[tag=gm4_liquid_tank,distance=..1] add test_destination

# create lava tank
data merge block ~2 ~1 ~2 {Items:[{Slot:0b,id:"minecraft:lava_bucket",Count:1b}]}

await block ~2 ~1 ~2 hopper{Items:[{Slot:0b,id:"minecraft:bucket",Count:1b}]}
await entity @e[tag=gm4_liquid_tank,tag=test_source,tag=gm4_lt_lava,scores={gm4_lt_value=3}]

# place liquid minecart
clear @s written_book
loot give @s loot gm4_liquid_minecarts:items/liquid_minecart
execute at @s run tp @s ~ ~ ~ facing ~1 ~-1.5 ~1
dummy @s use block ~2 ~1 ~1

await entity @e[tag=gm4_liquid_minecart,scores={gm4_lt_value=3}]
assert entity @e[tag=gm4_liquid_tank,tag=test_source,tag=gm4_lt_empty,scores={gm4_lt_value=0}]

# send the minecart
setblock ~2 ~ ~1 redstone_block

await entity @e[tag=gm4_liquid_tank,tag=test_destination,tag=gm4_lt_lava,scores={gm4_lt_value=3}]
assert entity @e[tag=gm4_liquid_minecart,scores={gm4_lt_value=0}]
