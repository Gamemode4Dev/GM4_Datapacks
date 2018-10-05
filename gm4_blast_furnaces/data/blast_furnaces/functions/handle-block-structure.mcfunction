# Called from main.mcfunction

# Find furnace
execute if entity @s[tag=gm4_bf_has_furnace] unless block ^ ^ ^1 furnace run tag @s remove gm4_bf_has_furnace
execute if entity @s[tag=!gm4_bf_has_furnace] run function blast_furnaces:search_furnace

execute if entity @s[tag=gm4_bf_has_furnace] at @s run function blast_furnaces:check_structure
