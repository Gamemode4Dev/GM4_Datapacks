scoreboard players set max_damage gm4_disassembler 1561
scoreboard players set max_items gm4_disassembler 2

function disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.1 minecraft:diamond
execute if score result_items gm4_disassembler matches 2.. run replaceitem block ~ ~ ~ container.4 minecraft:diamond

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.7 minecraft:stick
