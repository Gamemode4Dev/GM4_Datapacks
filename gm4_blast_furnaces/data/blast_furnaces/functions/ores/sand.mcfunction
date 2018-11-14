# Called from ores/recipes.mcfunction
# @s = valid smeltery at the furnace with sand



execute if entity @s[tag=!gm4_bf_ore_sand] run function blast_furnaces:ores/mark_sand
tag @s add gm4_bf_found
