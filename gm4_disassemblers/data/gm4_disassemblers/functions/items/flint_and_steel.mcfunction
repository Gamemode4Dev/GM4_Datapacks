scoreboard players set max_damage gm4_disassembler 64
scoreboard players set max_items gm4_disassembler 2

function gm4_disassemblers:calculate_percent

execute if score result_items gm4_disassembler matches 1.. run item replace block ~ ~ ~ container.0 with minecraft:iron_ingot

execute if score result_items gm4_disassembler matches 2.. run item replace block ~ ~ ~ container.4 with minecraft:flint
