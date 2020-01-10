scoreboard players set max_damage gm4_disassembler 250
scoreboard players set max_items gm4_disassembler 2

function gm4_disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.0 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 2.. run replaceitem block ~ ~ ~ container.1 minecraft:iron_ingot

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.4 minecraft:stick
execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.7 minecraft:stick
