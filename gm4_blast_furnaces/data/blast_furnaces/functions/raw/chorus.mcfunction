# Called from raw/recipes.mcfunction
# @s = valid smeltery at the furnace with chorus



execute if entity @s[tag=!gm4_bf_raw_chorus] run function blast_furnaces:raw/mark_chorus
tag @s add gm4_bf_found
