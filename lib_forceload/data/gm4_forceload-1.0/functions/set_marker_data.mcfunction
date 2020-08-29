# @s = new dimension marker AEC
# executed in minecraft:overworld
# run from mark_dimension

# scoreboard ID
scoreboard players add #max gm4_dimension 1
scoreboard players operation @s gm4_dimension = #max gm4_dimension

# name
data modify block 29999998 1 7133 Text1 set value '{"nbt": "Dimension", "entity": "@a[tag=gm4_in_new_dimension,limit=1]"}'
data modify entity @s CustomName set from block 29999998 1 7133 Text1 
