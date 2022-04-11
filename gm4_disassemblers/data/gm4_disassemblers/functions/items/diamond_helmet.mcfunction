scoreboard players set max_damage gm4_disassembler 363
scoreboard players set max_items gm4_disassembler 5

function gm4_disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run item replace block ~ ~ ~ container.0 with minecraft:diamond
execute if score result_items gm4_disassembler matches 2.. run item replace block ~ ~ ~ container.1 with minecraft:diamond
execute if score result_items gm4_disassembler matches 3.. run item replace block ~ ~ ~ container.2 with minecraft:diamond
execute if score result_items gm4_disassembler matches 4.. run item replace block ~ ~ ~ container.3 with minecraft:diamond
execute if score result_items gm4_disassembler matches 5.. run item replace block ~ ~ ~ container.5 with minecraft:diamond
