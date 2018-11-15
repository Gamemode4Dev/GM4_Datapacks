# Called from ores/recipes.mcfunction
# @s = valid smeltery at the furnace with gold ore



execute if entity @s[tag=!gm4_bf_ore_gold] run function blast_furnaces:ores/mark_gold
tag @s add gm4_bf_found
