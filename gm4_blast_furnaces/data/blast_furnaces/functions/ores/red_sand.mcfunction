# Called from ores/recipes.mcfunction
# @s = valid smeltery at the furnace with red sand



execute if entity @s[tag=!gm4_bf_ore_rsand] run function blast_furnaces:ores/mark_red_sand
tag @s add gm4_bf_found
