# Called from ores/recipes.mcfunction
# @s = valid smeltery at the furnace with chorus



execute if entity @s[tag=!gm4_bf_ore_chorus] run function blast_furnaces:ores/mark_chorus
tag @s add gm4_bf_found
