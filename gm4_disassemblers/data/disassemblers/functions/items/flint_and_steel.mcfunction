scoreboard players set max_damage gm4_disassembler 64
scoreboard players set max_items gm4_disassembler 2

function disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.0 minecraft:iron_ingot

execute if score result_items gm4_disassembler matches 2.. run replaceitem block ~ ~ ~ container.4 minecraft:flint
