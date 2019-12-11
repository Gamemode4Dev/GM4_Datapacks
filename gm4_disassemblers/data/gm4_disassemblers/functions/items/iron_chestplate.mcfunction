scoreboard players set max_damage gm4_disassembler 240
scoreboard players set max_items gm4_disassembler 8

function gm4_disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run replaceitem block ~ ~ ~ container.0 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 2.. run replaceitem block ~ ~ ~ container.2 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 3.. run replaceitem block ~ ~ ~ container.3 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 4.. run replaceitem block ~ ~ ~ container.4 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 5.. run replaceitem block ~ ~ ~ container.5 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 6.. run replaceitem block ~ ~ ~ container.6 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 7.. run replaceitem block ~ ~ ~ container.7 minecraft:iron_ingot
execute if score result_items gm4_disassembler matches 8.. run replaceitem block ~ ~ ~ container.8 minecraft:iron_ingot
