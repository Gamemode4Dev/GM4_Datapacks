# Called from raw/recipes.mcfunction
# @s = valid smeltery at the furnace with gold ore



execute if entity @s[tag=!gm4_bf_raw_gold] run function blast_furnaces:raw/mark_gold
tag @s add gm4_bf_found
