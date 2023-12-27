# @template gm4:test_platform
# @dummy ~1 ~1 ~

# Create custom crafter
setblock ~1 ~1 ~1 dropper[facing=up]{Items:[{Slot:0b,id:"minecraft:iron_ingot",Count:1b},{Slot:1b,id:"minecraft:light_blue_dye",Count:1b},{Slot:2b,id:"minecraft:iron_ingot",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}
give @s crafting_table
execute at @s run tp @s ~ ~ ~ facing ~ ~-0.5 ~1
dummy @s use block ~1 ~1 ~1

assert entity @e[tag=gm4_custom_crafter,distance=..3]

# Craft boots of ostara
data merge block ~1 ~1 ~1 {Items:[{Slot:1b,id:"minecraft:wheat_seeds",Count:1b},{Slot:3b,id:"minecraft:moss_block",Count:1b},{Slot:4b,id:"minecraft:leather_boots",Count:1b},{Slot:5b,id:"minecraft:grass_block",Count:1b},{Slot:7b,id:"minecraft:water_bucket",Count:1b}]}

await block ~1 ~1 ~1 dropper{Items:[{id:"minecraft:leather_boots",Count:1b,tag:{gm4_boots_of_ostara:1b}}]}
