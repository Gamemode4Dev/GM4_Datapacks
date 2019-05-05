scoreboard players set max_damage gm4_disassembler 32
scoreboard players set max_items gm4_disassembler 3

function disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.0 minecraft:gold_ingot
execute if score result_items gm4_disassembler matches 2.. run replaceitem block ~ ~ ~ container.1 minecraft:gold_ingot
execute if score result_items gm4_disassembler matches 3.. run replaceitem block ~ ~ ~ container.2 minecraft:gold_ingot

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.4 minecraft:stick
execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.7 minecraft:stick
