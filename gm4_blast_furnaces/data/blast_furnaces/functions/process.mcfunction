execute if entity @s[tag=gm4_blast_furnace_valid] run function blast_furnaces:validate_structure
execute if entity @s[tag=!gm4_blast_furnace_valid] run function blast_furnaces:find_structure

execute if entity @s[tag=gm4_blast_furnace_valid] positioned ^ ^ ^1 if block ~ ~ ~ furnace{CookTime:0s} run data merge entity @s {ArmorItems:[{},{},{},{}]}
execute if entity @s[tag=gm4_blast_furnace_valid] positioned ^ ^ ^1 if block ~ ~ ~ furnace[lit=true] run function blast_furnaces:display

execute unless block ~ ~ ~ hopper run function blast_furnaces:destroy
