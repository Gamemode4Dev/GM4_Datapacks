# Called from handle_block_structure.mcfunction

# @s = @e[tag=gm4_bf_output, tag=gm4_bf_has_furnace]

execute if entity @s[y_rotation=-90.0] unless block ~1 ~ ~ furnace[facing=east] run tag @s remove gm4_bf_has_furnace
execute if entity @s[y_rotation=90.0] unless block ~-1 ~ ~ furnace[facing=west] run tag @s remove gm4_bf_has_furnace
execute if entity @s[y_rotation=0.0] unless block ~ ~ ~1 furnace[facing=south] run tag @s remove gm4_bf_has_furnace
execute if entity @s[y_rotation=180.0] unless block ~ ~ ~-1 furnace[facing=north] run tag @s remove gm4_bf_has_furnace
