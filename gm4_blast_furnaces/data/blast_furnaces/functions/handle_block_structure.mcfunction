# Called from update.mcfunction
# @s = @e[tag=gm4_bf_output]

# Check if furnace still exists. Else remove `has_furnace` tag
execute if entity @s[tag=gm4_bf_has_furnace] unless block ^ ^ ^1 furnace run tag @s remove gm4_bf_has_furnace
execute if entity @s[tag=gm4_bf_has_furnace] run function blast_furnaces:check_furnace

# In case it doesn't have a furnce; Try to find one
execute if entity @s[tag=!gm4_bf_has_furnace] run function blast_furnaces:search_furnace

# If still not found, remove `has_structure` tag
execute if entity @s[tag=!gm4_bf_has_furnace] run tag @s remove gm4_bf_has_structure

# Check if there is (still) a valid structure around the hopper
execute if entity @s[tag=gm4_bf_has_furnace] at @s run function blast_furnaces:check_structure
