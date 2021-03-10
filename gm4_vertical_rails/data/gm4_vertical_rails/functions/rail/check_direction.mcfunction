# Checks if Vertical Rails go up or downward, prioritising up
# @s = minecart, touching a Vertical Rail (ladder)
# at @s
# run from process

tag @s add gm4_vert_rail_momentum

execute as @s[tag=!gm4_vert_rail_down] at @s if block ~ ~1 ~ ladder run tag @s add gm4_vert_rail_up
execute as @s[tag=!gm4_vert_rail_up] at @s if block ~ ~-1 ~ ladder unless block ~ ~1 ~ ladder run tag @s add gm4_vert_rail_down
