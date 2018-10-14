# Here is where all the main functions reside in

function blast_furnaces:required/setup-furnace-output
function blast_furnaces:required/furnace-output-break
function blast_furnaces:required/handle-block-structure
function blast_furnaces:required/handle-smelting

# =============== HANDLE OUTPUT BREAKING ====================
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:redstone",Count:1b},Passengers:[{id:"item",Item:{id:"minecraft:cobblestone",Count:7b}},{id:"item",Item:{id:"minecraft:iron_bars",Count:2b}},{id:"item",Item:{id:"minecraft:iron_block",Count:1b}},{id:"item",Item:{id:"minecraft:piston",Count:1b}},{id:"item",Item:{id:"minecraft:comparator",Count:2b}},{id:"item",Item:{id:"minecraft:redstone_torch",Count:1b}},{id:"item",Item:{id:"minecraft:crafting_table",Count:1b,tag:{display:{Lore:["slightly damaged workbench"]}}}}]}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run kill @s
