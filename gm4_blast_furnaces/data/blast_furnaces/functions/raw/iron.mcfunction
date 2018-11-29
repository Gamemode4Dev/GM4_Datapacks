# Called from raw/recipes.mcfunction
# @s = valid smeltery at the furnace with iron ore


execute if entity @s[tag=!gm4_bf_raw_iron] run function blast_furnaces:raw/mark_iron
tag @s add gm4_bf_found
