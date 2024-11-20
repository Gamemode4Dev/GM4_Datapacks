# @s = new dimension marker AEC
# executed in minecraft:overworld
# run from mark_dimension

# scoreboard ID
scoreboard players add #max gm4_dimension 1
scoreboard players operation @s gm4_dimension = #max gm4_dimension

# name
data modify block 29999998 1 7133 front_text.messages[0] set value '{"nbt": "Dimension", "entity": "@a[tag=gm4_in_new_dimension,limit=1]"}'
data modify entity @s CustomName set from block 29999998 1 7133 front_text.messages[0]

# move to forceloaded chunk
execute at @s run tp @s 29999999 0 7135
tag @s remove gm4_new_dimension
