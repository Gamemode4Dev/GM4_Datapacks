scoreboard players set max_damage gm4_disassembler 59
scoreboard players set max_items gm4_disassembler 3

function gm4_disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run item replace block ~ ~ ~ container.0 with minecraft:oak_planks
execute if score result_items gm4_disassembler matches 2.. run item replace block ~ ~ ~ container.1 with minecraft:oak_planks
execute if score result_items gm4_disassembler matches 3.. run item replace block ~ ~ ~ container.3 with minecraft:oak_planks

execute if score result_items gm4_disassembler matches 1.. run item replace block ~ ~ ~ container.4 with minecraft:stick
execute if score result_items gm4_disassembler matches 1.. run item replace block ~ ~ ~ container.7 with minecraft:stick
