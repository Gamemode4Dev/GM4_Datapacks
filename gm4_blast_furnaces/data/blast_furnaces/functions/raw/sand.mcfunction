# Called from raw/recipes.mcfunction
# @s = valid smeltery at the furnace with sand



execute if entity @s[tag=!gm4_bf_raw_sand] run function blast_furnaces:raw/mark_sand
tag @s add gm4_bf_found
