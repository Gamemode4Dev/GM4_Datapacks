# Called from main.mcfunction

# @s = @e[tag=gm4_bf_output]

function blast_furnaces:handle_block_structure
execute if entity @s[tag=!gm4_bf_has_structure, tag=gm4_bf_has_ore] run function blast_furnaces:ores/remove
execute unless block ~ ~ ~ hopper[facing=down] run function blast_furnaces:furnace_output_break
