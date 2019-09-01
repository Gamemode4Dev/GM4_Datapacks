#@s = blast furnace with dir 2 and a cook time of 199

scoreboard players set @s gm4_bf_ore 0
execute if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run scoreboard players set @s gm4_bf_ore 1
execute if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run scoreboard players set @s gm4_bf_ore 2

execute if score @s gm4_bf_ore matches 1.. run function blast_furnaces:check_validity/structure
