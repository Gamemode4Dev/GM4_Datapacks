# Called from raw/recipes.mcfunction
# @s = valid smeltery at the furnace with red sand



execute if entity @s[tag=!gm4_bf_raw_rsand] run function blast_furnaces:raw/mark_red_sand
tag @s add gm4_bf_found
