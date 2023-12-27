# @template gm4:test_platform
# @dummy ~ ~1 ~

# Create custom crafter
setblock ~1 ~1 ~ dropper[facing=up]{Items:[{Slot:0b,id:"minecraft:iron_ingot",Count:1b},{Slot:1b,id:"minecraft:light_blue_dye",Count:1b},{Slot:2b,id:"minecraft:iron_ingot",Count:1b},{Slot:3b,id:"minecraft:cobblestone",Count:1b},{Slot:5b,id:"minecraft:cobblestone",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}
give @s crafting_table
execute at @s run tp @s ~ ~ ~ facing ~1 ~-0.5 ~ 
dummy @s use block ~1 ~1 ~

assert entity @s[nbt=!{SelectedItem:{id:"minecraft:crafting_table"}}]
assert not block ~1 ~1 ~ dropper{Items:[{Count:1b}]}
assert entity @e[tag=gm4_custom_crafter,distance=..3]

# Craft block compressor
data merge block ~1 ~1 ~ {Items:[{Slot:0b,id:"minecraft:iron_ingot",Count:1b},{Slot:1b,id:"minecraft:purpur_block",Count:1b},{Slot:2b,id:"minecraft:iron_ingot",Count:1b},{Slot:3b,id:"minecraft:piston",Count:1b},{Slot:4b,id:"minecraft:obsidian",Count:1b},{Slot:5b,id:"minecraft:piston",Count:1b},{Slot:6b,id:"minecraft:cobblestone",Count:1b},{Slot:7b,id:"minecraft:cobblestone",Count:1b},{Slot:8b,id:"minecraft:cobblestone",Count:1b}]}

await block ~1 ~1 ~ dropper{Items:[{id:"minecraft:player_head",tag:{gm4_machines:{id:"block_compressor"}},Count:1b}]}
