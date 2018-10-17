# Called from search_furnace.mcfunction

# @s = @e[tag=gm4_bf_output, tag=!gm4_bf_has_furnace] if block ~-1 ~ ~ furnace[facing=west]


tp @s ~ ~ ~ 90 0
tag @s add gm4_bf_has_furnace
