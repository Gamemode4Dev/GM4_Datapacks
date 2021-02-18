# @s = tinkering_compressor not in a dropper block
# at @s
# run from tinkering_compressors:process

summon area_effect_cloud ~ ~ ~ {Passengers:[{id:item,Item:{id:"cobblestone",Count:7b}},{id:item,Item:{id:"redstone",Count:1b}},{id:item,Item:{id:"crafting_table",Count:1,tag:{display:{Lore:['"slightly damaged workbench"']}}}},{id:item,Item:{id:"iron_ingot",Count:4b}},{id:item,Item:{id:"obsidian",Count:2b}},{id:item,Item:{id:"piston",Count:2b}},{id:item,Item:{id:"purpur_block",Count:1b}}]}
loot spawn ~ ~ ~ loot gm4_tinker_shamir:band
kill @s
