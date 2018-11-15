# Called from ores/recipes.mcfunction
# @s = valid smeltery at the furnace with iron ore


execute if entity @s[tag=!gm4_bf_ore_iron] run function blast_furnaces:ores/mark_iron
tag @s add gm4_bf_found
