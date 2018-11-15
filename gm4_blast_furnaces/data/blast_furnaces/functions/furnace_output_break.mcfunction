# Called from main.mcfunction
# @s = @e[tag=gm4_bf_output] unless block ~ ~ ~ hopper[facing=down]

summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:redstone",Count:1b},Passengers:[{id:"item",Item:{id:"minecraft:cobblestone",Count:7b}},{id:"item",Item:{id:"minecraft:iron_bars",Count:2b}},{id:"item",Item:{id:"minecraft:iron_ingot",Count:4b}},{id:"item",Item:{id:"minecraft:piston",Count:1b}},{id:"item",Item:{id:"minecraft:comparator",Count:2b}},{id:"item",Item:{id:"minecraft:redstone_torch",Count:1b}},{id:"item",Item:{id:"minecraft:crafting_table",Count:1b,tag:{display:{Lore:["slightly damaged workbench"]}}}}]}
kill @s
